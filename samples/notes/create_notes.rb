require "ZOHOCRMSDK8_0"

class CreateNotes
	def self.create_notes
		begin
			notes_operations = ZOHOCRMSDK::Notes::NotesOperations.new
			
			# Create the request body
			request = ZOHOCRMSDK::Notes::BodyWrapper.new
			notes_list = []
			
			# Create first note
			note1 = ZOHOCRMSDK::Notes::Note.new
			note1.note_title = "Important Meeting Notes"
			note1.note_content = "Meeting notes from client discussion about project requirements and timeline. Key decisions made regarding deliverables and milestones."
			
			# Set parent record ID (the record to which this note will be attached)
			parent_record = ZOHOCRMSDK::Notes::ParentId.new
			parent_record.id = 1055806000028884055  # Replace with actual record ID
			module1 = ZOHOCRMSDK::Modules::MinifiedModule.new
			module1.id = 1055806000000002175  # Replace with actual module ID
			module1.api_name = "Leads"
			parent_record.module = module1
			note1.parent_id = parent_record

			notes_list.push(note1)
			
			# Create second note
			note2 = ZOHOCRMSDK::Notes::Note.new
			note2.note_title = "Follow-up Tasks"
			note2.note_content = "List of follow-up tasks: 1. Send proposal document 2. Schedule technical discussion 3. Prepare cost estimation 4. Review contract terms"
			
			# Set parent record ID for second note
			parent_record2 = ZOHOCRMSDK::Notes::ParentId.new
			parent_record2.id = 1055806000028884055  # Replace with actual record ID
			module2 = ZOHOCRMSDK::Modules::MinifiedModule.new
			module2.id = 1055806000000002175  # Replace with actual module ID
			module2.api_name = "Leads"
			parent_record2.module = module2
			note2.parent_id = parent_record2
			
			notes_list.push(note2)
			request.data = notes_list
			
			response = notes_operations.create_notes(request)
			
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
							action_responses.each_with_index do |action_response, index|
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
								end
							end
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
			create_notes
		rescue Exception => e
			raise e
		end
	end
end

CreateNotes.initialize_and_call