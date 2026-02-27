require "ZOHOCRMSDK8_0"

class GetAttachment
	def self.get_attachment
		attachment_id = 1055806000028846003
		record_id = 1055806000028754070
		module_name = "Leads"  # Can be Leads, Contacts, Accounts, etc.
		destination_folder = "./"
		
		attachments_operations = ZOHOCRMSDK::Attachments::AttachmentsOperations.new
		
		response = attachments_operations.get_attachment(attachment_id, record_id, module_name)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if response.is_expected
				response_handler = response.data_object
				if response_handler.is_a? ZOHOCRMSDK::Attachments::FileBodyWrapper
					file_body_wrapper = response_handler
					stream_wrapper = file_body_wrapper.file
					File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
						f.write(stream_wrapper.stream)
					end
				elsif file_body_wrapper.is_a? ZOHOCRMSDK::Attachments::APIException
					exception = file_body_wrapper
					print "API Exception during file download:\n"
					print "Status: " + exception.status.value + "\n"
					print "Code: " + exception.code.value + "\n"
					print "Details: \n"
					if exception.details != nil
						exception.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
					print "Message: " + exception.message.value + "\n"
				end
				
			else
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
			get_attachment
		rescue Exception => e
			raise e
		end
	end
end

GetAttachment.initialize_and_call