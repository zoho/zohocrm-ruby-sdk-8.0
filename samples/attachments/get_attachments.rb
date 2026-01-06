require "ZOHOCRMSDK8_0"

class GetAttachments
	def self.get_attachments
		record_id = 1055806000028754070
		module_name = "Leads"  # Can be Leads, Contacts, Accounts, etc.
		
		attachments_operations = ZOHOCRMSDK::Attachments::AttachmentsOperations.new
		param_instance = ZOHOCRMSDK::ParameterMap.new
		
		# Optional parameters
		# param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::GetAttachmentsParam.fields, "id,file_name,size,created_time")
		# param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::GetAttachmentsParam.page, 1)
		# param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::GetAttachmentsParam.per_page, 20)
		param_instance.add(ZOHOCRMSDK::Attachments::AttachmentsOperations::GetAttachmentsParam.ids, "1055806000028846003,1055806000028846001")
		
		response = attachments_operations.get_attachments(record_id, module_name, param_instance)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::Attachments::ResponseWrapper
					response_wrapper = response_handler
					attachments_list = response_wrapper.data
					
					if attachments_list != nil && attachments_list.length > 0
						print "Found #{attachments_list.length} attachments:\n"
						print "=" * 60 + "\n"
						
						attachments_list.each_with_index do |attachment, index|
							print "Attachment #{index + 1} Details:\n"
							
							# Basic attachment information
							if attachment.id != nil
								print "  Attachment ID: " + attachment.id.to_s + "\n"
							end
							
							if attachment.file_name != nil
								print "  File Name: " + attachment.file_name + "\n"
							end
							
							if attachment.size != nil
								print "  File Size: " + attachment.size.to_s + " bytes\n"
							end
							
							if attachment.type != nil
								print "  File Type: " + attachment.type + "\n"
							end
							
							if attachment.link_url != nil
								print "  Download URL: " + attachment.link_url + "\n"
							end
							
							# Attachment owner information
							if attachment.owner != nil
								owner = attachment.owner
								if owner.name != nil
									print "  Owner Name: " + owner.name + "\n"
								end
								if owner.id != nil
									print "  Owner ID: " + owner.id.to_s + "\n"
								end
								if owner.email != nil
									print "  Owner Email: " + owner.email + "\n"
								end
							end
							
							# Timestamps
							if attachment.created_time != nil
								print "  Created Time: " + attachment.created_time.to_s + "\n"
							end
							
							if attachment.modified_time != nil
								print "  Modified Time: " + attachment.modified_time.to_s + "\n"
							end
							
							# Created and Modified by information
							if attachment.created_by != nil
								created_by = attachment.created_by
								if created_by.name != nil
									print "  Created By: " + created_by.name + "\n"
								end
							end
							
							if attachment.modified_by != nil
								modified_by = attachment.modified_by
								if modified_by.name != nil
									print "  Modified By: " + modified_by.name + "\n"
								end
							end
							print "-" * 40 + "\n"
						end
						
						print "\nTotal Attachments: #{attachments_list.length}\n"
					else
						print "No attachments found for this record.\n"
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
					print "Message: " + exception.message.value + "\n"
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
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_attachments
		rescue Exception => e
			raise e
		end
	end
end

GetAttachments.initialize_and_call