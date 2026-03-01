require "ZOHOCRMSDK8_0"

class GetFieldAttachments
	def self.get_field_attachments
		module_api_name = "Leads"  # Replace with actual module API name
		record_id = 44024800167002  # Replace with actual record ID
		fields_attachment_id = 44024800167003  # Replace with actual field attachment ID
		destination_folder = "./"
		begin
			field_attachments_operations = ZOHOCRMSDK::FieldAttachments::FieldAttachmentsOperations.new(module_api_name, record_id, fields_attachment_id)
			
			response = field_attachments_operations.get_field_attachments
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.status_code == 204
					print "No Content\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::FieldAttachments::FileBodyWrapper
						file_body_wrapper = response_handler
						stream_wrapper = file_body_wrapper.file
						
						if stream_wrapper != nil
							File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
								f.write(stream_wrapper.stream)
							end
							print "Field attachment downloaded successfully to: " + destination_folder + "/" + stream_wrapper.name + "\n"
						else
							print "No file content received\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::FieldAttachments::APIException
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
			get_field_attachments
		rescue Exception => e
			raise e
		end
	end
end

GetFieldAttachments.initialize_and_call