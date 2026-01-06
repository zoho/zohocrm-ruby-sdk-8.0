require "ZOHOCRMSDK8_0"

class UpdateUsers
	def self.update_users
		begin
			# Initialize UsersOperations
			users_operations = ZOHOCRMSDK::Users::UsersOperations.new
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::Users::BodyWrapper.new
			users = []
			
			# Update first user
			user1 = ZOHOCRMSDK::Users::Users.new
			user1.id = 1055806000028914001  # Replace with actual user ID
			user1.first_name = "Updated John"
			user1.last_name = "Updated Smith"
			user1.phone = "+1-555-0001"
			
			users.push(user1)
			
			body_wrapper.users = users
			
			response = users_operations.update_users(body_wrapper)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::Users::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.users
						
						action_responses.each_with_index do |action_response, index|
							if action_response.is_a? ZOHOCRMSDK::Users::SuccessResponse
								success_response = action_response
								print "Status: " + success_response.status.value + "\n"
								print "Code: " + success_response.code.value + "\n"
								print "Message: " + success_response.message + "\n"
								
								if success_response.details != nil
									print "Update Details:\n"
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
			update_users
		rescue Exception => e
			raise e
		end
	end
end

UpdateUsers.initialize_and_call