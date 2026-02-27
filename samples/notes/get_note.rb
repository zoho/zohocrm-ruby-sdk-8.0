require "ZOHOCRMSDK8_0"

class GetNote
	def self.get_note
		note_id = 1055806000000208207  # Replace with actual note ID
		
		begin
			notes_operations = ZOHOCRMSDK::Notes::NotesOperations.new
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			
			response = notes_operations.get_note(note_id, param_instance, header_instance)
			
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
							note = notes_list[0]  # First note in response
							print "Note Details for ID: #{note_id}\n"
							
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
								print "  Owner Details:\n"
								
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
							print "  Additional Properties:\n"
							
							if note.size != nil
								print "    Size: " + note.size.to_s + " bytes\n"
							end
							
							if note.editable != nil
								print "    Editable: " + note.editable.to_s + "\n"
							end
							
							# Attachments (if any)
							if note.attachments != nil && note.attachments.length > 0
								print "  Attachments (#{note.attachments.length}):\n"
								note.attachments.each_with_index do |attachment, att_index|
									print "    #{att_index + 1}. " + attachment.file_name + " (" + attachment.size.to_s + " bytes)\n"
									if attachment.file_id != nil
										print "       File ID: " + attachment.file_id + "\n"
									end
								end
							else
								print "  No attachments found\n"
							end
							
							# Voice note properties (if applicable)
							if note.voice_note != nil
								voice_note = note.voice_note
								print "  Voice Note:\n"
								if voice_note.duration != nil
									print "    Duration: " + voice_note.duration.to_s + " seconds\n"
								end
								if voice_note.file_name != nil
									print "    File Name: " + voice_note.file_name + "\n"
								end
							end
							
							print "\nNote retrieved successfully!\n"
						else
							print "No note found with ID: #{note_id}\n"
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
			get_note
		rescue Exception => e
			raise e
		end
	end
end

GetNote.initialize_and_call