require "ZOHOCRMSDK8_0"

class DeleteContactRole
	def self.delete_contact_role
		contact_roles_operations = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
		
		# Delete specific contact role by ID
		role_id = 1055806000028870003  # Replace with actual role ID to delete
		
		response = contact_roles_operations.delete_contact_role(role_id)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			if response.is_expected
				action_handler = response.data_object
				
				if action_handler.is_a? ZOHOCRMSDK::ContactRoles::ActionWrapper
					action_wrapper = action_handler
					action_responses = action_wrapper.contact_roles
					
					if action_responses != nil && action_responses.length > 0
						action_responses.each_with_index do |action_response, index|
							if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
								success_response = action_response
								if success_response.status != nil
									print "  Status: " + success_response.status.value + "\n"
								end
								
								if success_response.code != nil
									print "  Code: " + success_response.code.value + "\n"
								end
								
								if success_response.message != nil
									print "  Message: " + success_response.message.value + "\n"
								end
								
								if success_response.details != nil && success_response.details.length > 0
									print "  Role Details:\n"
									success_response.details.each do |key, value|
										print "    " + key + ": " + value.to_s + "\n"
									end
								end
							elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
								exception = action_response
								if exception.status != nil
									print "  Status: " + exception.status.value + "\n"
								end
								
								if exception.code != nil
									print "  Code: " + exception.code.value + "\n"
								end
								
								if exception.message != nil
									print "  Message: " + exception.message.value + "\n"
								end
								
								if exception.details != nil && exception.details.length > 0
									print "  Error Details:\n"
									exception.details.each do |key, value|
										print "    " + key + ": " + value.to_s + "\n"
									end
								end
							end
						end
					end
				elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
					exception = action_handler
					if exception.status != nil
						print "Status: " + exception.status.value + "\n"
					end
					
					if exception.code != nil
						print "Code: " + exception.code.value + "\n"
					end
					
					if exception.message != nil
						print "Message: " + exception.message.value + "\n"
					end
					
					if exception.details != nil && exception.details.length > 0
						print "Error Details:\n"
						exception.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
				end
			end
		else
			print "Error: No response received from server\n"
			print "Check your network connection and API configuration.\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			delete_contact_role
		rescue Exception => e
			raise e
		end
	end
end

DeleteContactRole.initialize_and_call