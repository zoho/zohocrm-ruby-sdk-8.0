require "ZOHOCRMSDK8_0"

class GetTaxes
	def self.get_taxes
		begin
			# Initialize TaxesOperations
			taxes_operations = ZOHOCRMSDK::Taxes::TaxesOperations.new
			
			response = taxes_operations.get_taxes
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No taxes found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Taxes::ResponseWrapper
						response_wrapper = response_handler
						org_taxes = response_wrapper.org_taxes
						taxes = org_taxes.taxes
						if taxes != nil && taxes.length > 0
							taxes.each_with_index do |tax, index|
								if tax.display_label != nil
									print "Display Label: " + tax.display_label + "\n"
								end
								
								if tax.name != nil
									print "Tax Name: " + tax.name + "\n"
								end
								
								if tax.id != nil
									print "Tax ID: " + tax.id.to_s + "\n"
								end
								
								if tax.value != nil
									print "Tax Value: " + tax.value.to_s + "%\n"
								end
							end
						end
						preferences = org_taxes.preference
						if preferences != nil
							print "AutoPopulateTax: " + preferences.auto_populate_tax.to_s + "\n"
							if preferences.modify_tax_rates != nil
								print "ModifyTaxRates: " + preferences.modify_tax_rates.to_s + "\n"
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Taxes::APIException
						exception = response_handler
						print "Taxes API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Message: " + exception.message.value + "\n"
						
						if exception.details != nil
							print "Error Details:\n"
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
					end
				end
			end
			
		rescue ZOHOCRMSDK::SDKException => e
			print "SDKException:\n"
			print "Error Code: " + e.code.to_s + "\n"
			print "Error Message: " + e.message + "\n"
			
		rescue Exception => e
			print "Exception:\n"
			print e.message + "\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_taxes
		rescue Exception => e
			raise e
		end
	end
end

GetTaxes.initialize_and_call