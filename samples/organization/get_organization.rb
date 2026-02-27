require "ZOHOCRMSDK8_0"

class GetOrganization
	def self.get_organization
		begin
			org_operations = ZOHOCRMSDK::Org::OrgOperations.new
			response = org_operations.get_organization
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Org::ResponseWrapper
						response_wrapper = response_handler
						organization_list = response_wrapper.org
						
						if organization_list != nil && organization_list.length > 0
							
							organization_list.each_with_index do |organization, index|
								# Basic organization information
								if organization.id != nil
									print "  Organization ID: " + organization.id.to_s + "\n"
								end
								
								if organization.company_name != nil
									print "  Company Name: " + organization.company_name + "\n"
								end
								
								if organization.primary_zuid != nil
									print "  Primary ZUID: " + organization.primary_zuid.to_s + "\n"
								end
								
								# Contact information
								if organization.phone != nil
									print "  Phone: " + organization.phone + "\n"
								end
								
								if organization.mobile != nil
									print "  Mobile: " + organization.mobile + "\n"
								end
								
								if organization.website != nil
									print "  Website: " + organization.website + "\n"
								end
								
								if organization.primary_email != nil
									print "  Primary Email: " + organization.primary_email + "\n"
								end
								
								# Address information
								if organization.street != nil
									print "  Street: " + organization.street + "\n"
								end
								
								if organization.city != nil
									print "  City: " + organization.city + "\n"
								end
								
								if organization.state != nil
									print "  State: " + organization.state + "\n"
								end
								
								if organization.country != nil
									print "  Country: " + organization.country + "\n"
								end
								
								if organization.zip != nil
									print "  Zip Code: " + organization.zip + "\n"
								end
								
								# Business information
								if organization.employee_count != nil
									print "  Employee Count: " + organization.employee_count + "\n"
								end
								
								if organization.time_zone != nil
									print "  Time Zone: " + organization.time_zone + "\n"
								end
								
								if organization.currency != nil
									print "  Currency: " + organization.currency + "\n"
								end
								
								if organization.currency_locale != nil
									print "  Currency Locale: " + organization.currency_locale + "\n"
								end
								
								if organization.currency_symbol != nil
									print "  Currency Symbol: " + organization.currency_symbol + "\n"
								end
								
								# System settings
								if organization.iso_code != nil
									print "  ISO Code: " + organization.iso_code + "\n"
								end
								
								# License information
								if organization.zgid != nil
									print "  ZGID: " + organization.zgid.to_s + "\n"
								end
								
								if organization.country_code != nil
									print "  Country Code: " + organization.country_code + "\n"
								end
								
								# Additional properties
								if organization.description != nil
									print "  Description: " + organization.description + "\n"
								end
								
								if organization.mc_status != nil
									print "  MC Status: " + organization.mc_status.to_s + "\n"
								end
								
								if organization.gapps_enabled != nil
									print "  GApps Enabled: " + organization.gapps_enabled.to_s + "\n"
								end
								
								# Domain information
								if organization.domain_name != nil
									print "  Domain Name: " + organization.domain_name + "\n"
								end
								
								if organization.translation_enabled != nil
									print "  Translation Enabled: " + organization.translation_enabled.to_s + "\n"
								end
								
								# Photo URL
								if organization.photo_id != nil
									print "  Photo ID: " + organization.photo_id.to_s + "\n"
								end
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Org::APIException
						exception = response_handler
						print "API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Details:\n"
						if exception.details != nil
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
						print "Message: " + exception.message + "\n"
					end
				end
			end
			
		rescue ZOHOCRMSDK::SDKException => e
			print "SDKException:\n"
			print "Error Code: " + e.code.to_s + "\n"
			print "Error Message: " + e.message + "\n"
			print "Error Details: " + e.details.to_s + "\n"
			
		rescue Exception => e
			print "Exception:\n"
			print e.message + "\n"
			print e.backtrace.join("\n") + "\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_organization
		rescue Exception => e
			raise e
		end
	end
end

GetOrganization.initialize_and_call