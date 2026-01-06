require "ZOHOCRMSDK8_0"

class UpdateTaxes
	def self.update_taxes
		begin
			# Initialize TaxesOperations
			taxes_operations = ZOHOCRMSDK::Taxes::TaxesOperations.new
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::Taxes::BodyWrapper.new
			org_taxes = ZOHOCRMSDK::Taxes::OrgTax.new
			taxes = []
			
			# Update first tax
			tax1 = ZOHOCRMSDK::Taxes::Tax.new
			tax1.id = 1055806000013694003  # Replace with actual tax ID
			tax1.value = 8.5  # Updated tax rate
			taxes.push(tax1)
			org_taxes.taxes = taxes
			body_wrapper.org_taxes = org_taxes
			
			response = taxes_operations.update_taxes(body_wrapper)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::Taxes::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.org_taxes
						
						if action_response.is_a? ZOHOCRMSDK::Taxes::SuccessResponse
							success_response = action_response
							print "Status: " + success_response.status.value + "\n"
							print "Code: " + success_response.code.value + "\n"
							print "Message: " + success_response.message.value + "\n"
							
							if success_response.details != nil
								print "Update Details:\n"
								success_response.details.each do |key, value|
									print "  " + key + ": " + value.to_s + "\n"
								end
							end
							
						elsif action_response.is_a? ZOHOCRMSDK::Taxes::APIException
							api_exception = action_response
							print "Status: " + api_exception.status.value + "\n"
							print "Code: " + api_exception.code.value + "\n"
							print "Message: " + api_exception.message.value + "\n"
							
							if api_exception.details != nil
								print "Error Details:\n"
								api_exception.details.each do |key, value|
									print "  " + key + ": " + value.to_s + "\n"
								end
							end
						end
						
					elsif action_handler.is_a? ZOHOCRMSDK::Taxes::APIException
						exception = action_handler
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
				else
					response_object = response.data_object
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
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
			update_taxes
		rescue Exception => e
			raise e
		end
	end
end

UpdateTaxes.initialize_and_call