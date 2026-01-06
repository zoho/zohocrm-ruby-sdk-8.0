require "ZOHOCRMSDK8_0"

class GetRoles
	def self.get_roles
		contact_roles_operations = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
		
		response = contact_roles_operations.get_roles
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::ContactRoles::ResponseWrapper
					response_wrapper = response_handler
					contact_roles_list = response_wrapper.contact_roles
					
					if contact_roles_list != nil && contact_roles_list.length > 0
						contact_roles_list.each_with_index do |contact_role, index|
							# Basic role information
							if contact_role.id != nil
								print "  Role ID: " + contact_role.id.to_s + "\n"
							end
							
							if contact_role.name != nil
								print "  Role Name: " + contact_role.name + "\n"
							end
							
							if contact_role.sequence_number != nil
								print "  Sequence Number: " + contact_role.sequence_number.to_s + "\n"
							end
						end
					end
					
				elsif response_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
					print "Message: " + exception.message.value + "\n"
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
			get_roles
		rescue Exception => e
			raise e
		end
	end
end

GetRoles.initialize_and_call