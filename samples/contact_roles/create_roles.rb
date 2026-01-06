require "ZOHOCRMSDK8_0"

class CreateRoles
	def self.create_roles
		contact_roles_operations = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
		request = ZOHOCRMSDK::ContactRoles::BodyWrapper.new
		
		# Create list of contact roles
		contact_roles_list = []
		
		# Create first contact role
		contact_role1 = ZOHOCRMSDK::ContactRoles::ContactRole.new
		contact_role1.name = "Decision Maker"
		contact_role1.sequence_number = 1
		contact_roles_list.push(contact_role1)
		
		# Create second contact role
		contact_role2 = ZOHOCRMSDK::ContactRoles::ContactRole.new
		contact_role2.name = "Technical Evaluator"
		contact_role2.sequence_number = 2
		contact_roles_list.push(contact_role2)
		
		# Create third contact role
		contact_role3 = ZOHOCRMSDK::ContactRoles::ContactRole.new
		contact_role3.name = "Influencer"
		contact_role3.sequence_number = 3
		contact_roles_list.push(contact_role3)
		
		request.contact_roles = contact_roles_list
		
		response = contact_roles_operations.create_roles(request)
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
			create_roles
		rescue Exception => e
			raise e
		end
	end
end

CreateRoles.initialize_and_call