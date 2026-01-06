require "ZOHOCRMSDK8_0"

class DeleteUser
	def self.delete_user
		begin
			# Set user ID to delete
			user_id = 1055806000028914001  # Replace with actual user ID
			
			# Initialize UsersOperations
			users_operations = ZOHOCRMSDK::Users::UsersOperations.new
			
			response = users_operations.delete_user(user_id)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::Users::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.users
						
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::Users::SuccessResponse
								success_response = action_response
								print "Status: " + success_response.status.value + "\n"
								print "Code: " + success_response.code.value + "\n"
								print "Message: " + success_response.message + "\n"
								
								if success_response.details != nil
									print "Deletion Details:\n"
									success_response.details.each do |key, value|
										print "  " + key + ": " + value.to_s + "\n"
									end
								end
							elsif action_response.is_a? ZOHOCRMSDK::Users::APIException
								api_exception = action_response
								print "Status: " + api_exception.status.value + "\n"
								print "Code: " + api_exception.code.value + "\n"
								print "Message: " + api_exception.message + "\n"
								
								if api_exception.details != nil
									print "Error Details:\n"
									api_exception.details.each do |key, value|
										print "  " + key + ": " + value.to_s + "\n"
									end
								end
								
								print "Failed to delete user with ID " + user_id.to_s + "\n"
							end
						end
						
					elsif action_handler.is_a? ZOHOCRMSDK::Users::APIException
						exception = action_handler
						print "Users API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Message: " + exception.message + "\n"
						
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
			delete_user
		rescue Exception => e
			raise e
		end
	end
end

DeleteUser.initialize_and_call