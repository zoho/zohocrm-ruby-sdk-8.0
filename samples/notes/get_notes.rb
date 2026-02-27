require "ZOHOCRMSDK8_0"

class GetNotes
	def self.get_notes
		begin
			notes_operations = ZOHOCRMSDK::Notes::NotesOperations.new

			param_instance = ZOHOCRMSDK::ParameterMap.new
			# param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.page, 1)
			# param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.per_page, 200)
			param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.fields, "Note_Title,Note_Content,Created_Time")
			# param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.sort_order, "desc")
			# param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.sort_by, "Created_Time")
			# param_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.ids, "1055806000000691001,1055806000000691002")
			
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			
			# Add optional headers
			# header_instance.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesHeader.If_modified_since, DateTime.new(2023, 1, 1))
			
			response = notes_operations.get_notes(param_instance, header_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Notes::ResponseWrapper
						response_wrapper = response_handler
						notes_list = response_wrapper.data
						
						if notes_list != nil && notes_list.length > 0
							print "Total Notes: " + notes_list.length.to_s + "\n"
							
							notes_list.each_with_index do |note, index|
								print "\n--- Note #{index + 1} ---\n"
								
								# Basic note information
								if note.id != nil
									print "  Note ID: " + note.id.to_s + "\n"
								end
								
								if note.note_title != nil
									print "  Note Title: " + note.note_title + "\n"
								end
								
								if note.note_content != nil
									print "  Note Content: " + note.note_content + "\n"
								end
								
								# Owner information
								if note.owner != nil
									owner = note.owner
									print "  Owner:\n"
									
									if owner.id != nil
										print "    ID: " + owner.id.to_s + "\n"
									end
									
									if owner.name != nil
										print "    Name: " + owner.name + "\n"
									end
									
									if owner.email != nil
										print "    Email: " + owner.email + "\n"
									end
								end
								
								# Created by information
								if note.created_by != nil
									created_by = note.created_by
									print "  Created By:\n"
									
									if created_by.id != nil
										print "    ID: " + created_by.id.to_s + "\n"
									end
									
									if created_by.name != nil
										print "    Name: " + created_by.name + "\n"
									end
									
									if created_by.email != nil
										print "    Email: " + created_by.email + "\n"
									end
								end
								
								# Modified by information
								if note.modified_by != nil
									modified_by = note.modified_by
									print "  Modified By:\n"
									
									if modified_by.id != nil
										print "    ID: " + modified_by.id.to_s + "\n"
									end
									
									if modified_by.name != nil
										print "    Name: " + modified_by.name + "\n"
									end
									
									if modified_by.email != nil
										print "    Email: " + modified_by.email + "\n"
									end
								end
								
								# Timestamps
								if note.created_time != nil
									print "  Created Time: " + note.created_time.to_s + "\n"
								end
								
								if note.modified_time != nil
									print "  Modified Time: " + note.modified_time.to_s + "\n"
								end
								
								# Parent record information (if note is attached to a record)
								if note.parent_id != nil
									parent_id = note.parent_id
									print "  Parent Record:\n"
									
									if parent_id.id != nil
										print "    ID: " + parent_id.id.to_s + "\n"
									end
									
									if parent_id.name != nil
										print "    Name: " + parent_id.name + "\n"
									end
								end
								
								# Additional note properties
								if note.size != nil
									print "  Size: " + note.size.to_s + " bytes\n"
								end
								
								if note.editable != nil
									print "  Editable: " + note.editable.to_s + "\n"
								end
								
								# Attachments (if any)
								if note.attachments != nil && note.attachments.length > 0
									print "  Attachments (#{note.attachments.length}):\n"
									note.attachments.each_with_index do |attachment, att_index|
										print "    #{att_index + 1}. " + attachment.file_name + " (" + attachment.size.to_s + " bytes)\n"
									end
								end
							end
							
							print "\nNotes retrieved successfully!\n"
						else
							print "No notes found.\n"
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
			get_notes
		rescue Exception => e
			raise e
		end
	end
end

GetNotes.initialize_and_call