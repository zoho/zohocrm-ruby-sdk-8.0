require "ZOHOCRMSDK8_0"

class UpdateModule
	def self.update_module
		module_id = 105580600000000217 # Replace with actual module ID
		
		begin
			modules_operations = ZOHOCRMSDK::Modules::ModulesOperations.new
			
			# Create the request body
			request = ZOHOCRMSDK::Modules::BodyWrapper.new
			modules_list = []
			
			# Create module update object
			module_info = ZOHOCRMSDK::Modules::Modules.new
			module_info.description = "Updated module description with new features and capabilities"
			
			# Update profiles for the module
			profiles = []
			
			# Administrator profile
			profile1 = ZOHOCRMSDK::Profiles::MinifiedProfile.new
			profile1.id = 1055806000000026011  # Replace with actual profile ID
			profiles.push(profile1)
			
			module_info.profiles = profiles
			
			modules_list.push(module_info)
			request.modules = modules_list
			
			response = modules_operations.update_module(module_id, request)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.status_code == 204
					print "No Content\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Modules::ActionWrapper
						action_wrapper = response_handler
						action_responses = action_wrapper.modules
						
						if action_responses != nil
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::Modules::SuccessResponse
									success_response = action_response
									print "Status: " + success_response.status.value + "\n"
									print "Code: " + success_response.code.value + "\n"
									print "Details:\n"
									if success_response.details != nil
										success_response.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									print "Message: " + success_response.message.value + "\n"
									print "---\n"
									
								elsif action_response.is_a? ZOHOCRMSDK::Modules::APIException
									exception = action_response
									print "Status: " + exception.status.value + "\n"
									print "Code: " + exception.code.value + "\n"
									print "Details:\n"
									if exception.details != nil
										exception.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									print "Message: " + exception.message + "\n"
									print "---\n"
								end
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Modules::APIException
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
					
				else
					print "Unexpected HTTP Error Code: " + response.status_code.to_s + "\n"
					response_object = response.data_object
					if response_object != nil
						response_object.instance_variables.each do |field|
							print field.to_s + " = " + response_object.instance_variable_get(field).to_s + "\n"
						end
					end
				end
			else
				print "Error: No response received from server\n"
				print "Check your network connection and API configuration.\n"
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
			update_module
		rescue Exception => e
			raise e
		end
	end
end

UpdateModule.initialize_and_call