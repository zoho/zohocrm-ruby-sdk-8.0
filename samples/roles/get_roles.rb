require "ZOHOCRMSDK8_0"

class GetRoles
	def self.get_roles
		begin
			# Initialize RolesOperations
			roles_operations = ZOHOCRMSDK::Roles::RolesOperations.new
			response = roles_operations.get_roles
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No roles found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Roles::ResponseWrapper
						response_wrapper = response_handler
						roles = response_wrapper.roles
						
						if roles != nil && roles.length > 0
							roles.each_with_index do |role, index|
								if role.display_label != nil
									print "Display Label: " + role.display_label + "\n"
								end
								
								if role.forecast_manager != nil
									forecast_manager = role.forecast_manager
									if forecast_manager.is_a? ZOHOCRMSDK::Users::MinifiedUser
										print "Forecast Manager: " + (forecast_manager.name || "N/A") + " (ID: " + (forecast_manager.id || "N/A").to_s + ")\n"
									else
										print "Forecast Manager: " + forecast_manager.to_s + "\n"
									end
								end
								
								if role.share_with_peers != nil
									print "Share With Peers: " + role.share_with_peers.to_s + "\n"
								end
								
								if role.name != nil
									print "Name: " + role.name + "\n"
								end
								
								if role.description != nil
									print "Description: " + role.description + "\n"
								end
								
								if role.id != nil
									print "ID: " + role.id.to_s + "\n"
								end
								
								if role.reporting_to != nil
									reporting_to = role.reporting_to
									if reporting_to.is_a? ZOHOCRMSDK::Users::MinifiedUser
										print "Reporting To: " + (reporting_to.name || "N/A") + " (ID: " + (reporting_to.id || "N/A").to_s + ")\n"
									else
										print "Reporting To: " + reporting_to.to_s + "\n"
									end
								end
								
								if role.admin_user != nil
									print "Admin User: " + role.admin_user.to_s + "\n"
								end
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Roles::APIException
						exception = response_handler
						print "Roles API Exception:\n"
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
			get_roles
		rescue Exception => e
			raise e
		end
	end
end

GetRoles.initialize_and_call