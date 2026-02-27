require "ZOHOCRMSDK8_0"

class GetUsers
	def self.get_users
		begin
			# Initialize UsersOperations
			users_operations = ZOHOCRMSDK::Users::UsersOperations.new
			
			# Create ParameterMap for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			# param_instance.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersParam.type, "ActiveUsers")
			# param_instance.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersParam.page, 1)
			# param_instance.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersParam.per_page, 200)
			
			# Create HeaderMap for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			# header_instance.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersHeader.If_modified_since, DateTime.new(2020, 1, 1, 10, 0, 0))
			
			response = users_operations.get_users(param_instance, header_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No users found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Users::ResponseWrapper
						response_wrapper = response_handler
						users = response_wrapper.users
						if users != nil && users.length > 0
							users.each_with_index do |user, index|
								if user.id != nil
									print "User ID: " + user.id.to_s + "\n"
								end
								
								if user.name != nil
									print "User Name: " + user.name + "\n"
								end
								
								if user.email != nil
									print "Email: " + user.email + "\n"
								end
								
								if user.role != nil
									print "Role: " + user.role.name + " (" + user.role.id.to_s + ")\n"
								end
								
								if user.profile != nil
									print "Profile: " + user.profile.name + " (" + user.profile.id.to_s + ")\n"
								end
								
								if user.status != nil
									print "Status: " + user.status + "\n"
								end
								
								if user.phone != nil
									print "Phone: " + user.phone + "\n"
								end
							end
						else
							print "No users found\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Users::APIException
						exception = response_handler
						print "Users API Exception:\n"
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
			get_users
		rescue Exception => e
			raise e
		end
	end
end

GetUsers.initialize_and_call