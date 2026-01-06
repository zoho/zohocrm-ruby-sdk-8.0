require "ZOHOCRMSDK8_0"

class DeleteAttachments
	def self.delete_attachments
		record_id = 1055806000028754070
		module_name = "Leads"  # Can be Leads, Contacts, Accounts, etc.
		
		attachments_operations = ZOHOCRMSDK::Attachments::AttachmentsOperations.new
		param_instance = ZOHOCRMSDK::ParameterMap.new
		
		# Attachment IDs to delete (comma-separated)
		attachment_ids = "1055806000028846001,1055806000028846003,1055806000028846003"
		param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::DeleteAttachmentsParam.ids, attachment_ids)
		
		response = attachments_operations.delete_attachments(record_id, module_name, param_instance)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if response.status_code == 204
				print "No Content\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				# print response_handler.class.to_s + "\n"
				
				if response_handler.is_a? ZOHOCRMSDK::Attachments::ActionWrapper
					action_wrapper = response_handler
					action_responses = action_wrapper.data
					
					if action_responses != nil
						
						action_responses.each_with_index do |action_response, index|
							if action_response.is_a? ZOHOCRMSDK::Attachments::SuccessResponse
								success_response = action_response
								print "  Status: " + success_response.status.value + "\n"
								print "  Code: " + success_response.code.value + "\n"
								print "  Details: \n"
								if success_response.details != nil
									success_response.details.each do |key, value|
										print "    " + key + ": " + value.to_s + "\n"
									end
								end
								print "  Message: " + success_response.message + "\n"
								
							elsif action_response.is_a? ZOHOCRMSDK::Attachments::APIException
								exception = action_response
								print "  Status: " + exception.status.value + "\n"
								print "  Code: " + exception.code.value + "\n"
								print "  Details: \n"
								if exception.details != nil
									exception.details.each do |key, value|
										print "    " + key + ": " + value.to_s + "\n"
									end
								end
								print "  Message: " + exception.message + "\n"
							end
						end
					end
					
				elsif response_handler.is_a? ZOHOCRMSDK::Attachments::APIException
					exception = response_handler
					print "API Exception:\n"
					print "Status: " + exception.status.value + "\n"
					print "Code: " + exception.code.value + "\n"
					print "Details: \n"
					if exception.details != nil
						exception.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
					print "Message: " + exception.message + "\n"
				end
				
			elsif response.status_code != 204
				response_object = response.data_object
				response_object.instance_variables.each do |field|
					print field.to_s + "\n"
					print response_object.instance_variable_get(field).to_s + "\n"
				end
			end
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			delete_attachments
		rescue Exception => e
			raise e
		end
	end
end

DeleteAttachments.initialize_and_call