require "ZOHOCRMSDK8_0"

class AssociateContactRoleToDeal
	def self.associate_contact_role_to_deal
		deal_contact_roles_operations = ZOHOCRMSDK::DealContactRoles::DealContactRolesOperations.new
		
		contact_id = 1055806000028594016  # Replace with actual contact ID
		deal_id = 1055806000028564012    # Replace with actual deal ID
		request = ZOHOCRMSDK::DealContactRoles::BodyWrapper.new
		
		# Create contact role wrapper list
		contact_role_data = []
		
		data = ZOHOCRMSDK::DealContactRoles::Data.new
		# Create contact role wrapper
		contact_role_wrapper = ZOHOCRMSDK::DealContactRoles::ContactRole.new
		contact_role_wrapper.name = "Decision Maker"  # Specify the role
		data.contact_role = contact_role_wrapper
		contact_role_data.push(data)
		request.data = contact_role_data
		
		response = deal_contact_roles_operations.associate_contact_role_to_deal(contact_id, deal_id, request)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"			
			if response.is_expected
				action_handler = response.data_object
				
				if action_handler.is_a? ZOHOCRMSDK::DealContactRoles::ActionWrapper
					action_wrapper = action_handler
					action_responses = action_wrapper.data
					
					if action_responses != nil && action_responses.length > 0
						action_response = action_responses[0]
						
						if action_response.is_a? ZOHOCRMSDK::DealContactRoles::SuccessResponse
							success_response = action_response
							if success_response.status != nil
								print "Status: " + success_response.status.value + "\n"
							end
							
							if success_response.code != nil
								print "Code: " + success_response.code.value + "\n"
							end
							
							if success_response.message != nil
								print "Message: " + success_response.message + "\n"
							end
							
							if success_response.details != nil && success_response.details.length > 0
								print "Details:\n"
								success_response.details.each do |key, value|
									print "    " + key + ": " + value.to_s + "\n"
								end
							end
						elsif action_response.is_a? ZOHOCRMSDK::DealContactRoles::APIException
							exception = action_response
							if exception.status != nil
								print "Status: " + exception.status.value + "\n"
							end
							
							if exception.code != nil
								print "Code: " + exception.code.value + "\n"
							end
							
							if exception.message != nil
								print "Message: " + exception.message + "\n"
							end
							
							if exception.details != nil && exception.details.length > 0
								print "Error Details:\n"
								exception.details.each do |key, value|
									print "  " + key + ": " + value.to_s + "\n"
								end
							end
						end
					end
					
				elsif action_handler.is_a? ZOHOCRMSDK::DealContactRoles::APIException
					exception = action_handler
					if exception.status != nil
						print "Status: " + exception.status.value + "\n"
					end
					
					if exception.code != nil
						print "Code: " + exception.code.value + "\n"
					end
					
					if exception.message != nil
						print "Message: " + exception.message + "\n"
					end
					
					if exception.details != nil && exception.details.length > 0
						print "Error Details:\n"
						exception.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
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
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			associate_contact_role_to_deal
		rescue Exception => e
			raise e
		end
	end
end

AssociateContactRoleToDeal.initialize_and_call