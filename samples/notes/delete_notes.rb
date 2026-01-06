require "ZOHOCRMSDK8_0"

class DeleteNotes
	def self.delete_notes
		begin
			notes_operations = ZOHOCRMSDK::Notes::NotesOperations.new
			
			# Create parameter map for note IDs to delete
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Add note IDs to delete (comma-separated string)
			note_ids = "1055806000028870007,1055806000028870008,1055806000028870009"  # Replace with actual note IDs
			param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::DeleteNotesParam.ids, note_ids)
			
			response = notes_operations.delete_notes(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.status_code == 204
					print "No Content\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Notes::ActionWrapper
						action_wrapper = response_handler
						action_responses = action_wrapper.data
						
						if action_responses != nil
							print "Notes Deletion Results:\n"
							
							action_responses.each_with_index do |action_response, index|
								print "\n--- Note #{index + 1} Deletion Result ---\n"
								
								if action_response.is_a? ZOHOCRMSDK::Notes::SuccessResponse
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
									print "Note deleted successfully!\n"
									
								elsif action_response.is_a? ZOHOCRMSDK::Notes::APIException
									exception = action_response
									print "Status: " + exception.status.value + "\n"
									print "Code: " + exception.code.value + "\n"
									print "Details:\n"
									if exception.details != nil
										exception.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									print "Message: " + exception.message.value + "\n"
									print "Failed to delete note\n"
								end
							end
							
							print "\nNotes deletion process completed!\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Notes::APIException
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
			delete_notes
		rescue Exception => e
			raise e
		end
	end
end

DeleteNotes.initialize_and_call