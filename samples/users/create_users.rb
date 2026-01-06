require "ZOHOCRMSDK8_0"

class CreateUsers
	def self.create_users
		begin
			# Initialize UsersOperations
			users_operations = ZOHOCRMSDK::Users::UsersOperations.new
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::Users::BodyWrapper.new
			users = []
			
			# Create first user
			user1 = ZOHOCRMSDK::Users::Users.new
			user1.last_name = "Smith"
			user1.first_name = "John"
			user1.email = "rubysdk@example.com"
			
			# Set role
			role = ZOHOCRMSDK::Users::Role.new
			role.id = 1055806000000026005  # Replace with actual role ID
			user1.role = role
			
			# Set profile
			profile = ZOHOCRMSDK::Users::Profile.new
			profile.id = 1055806000000026014  # Replace with actual profile ID
			user1.profile = profile
			
			users.push(user1)
			
			body_wrapper.users = users
			
			response = users_operations.create_users(body_wrapper)
			
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
									print "Creation Details:\n"
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
			create_users
		rescue Exception => e
			raise e
		end
	end
end

CreateUsers.initialize_and_call