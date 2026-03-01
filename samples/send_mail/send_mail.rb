require "ZOHOCRMSDK8_0"

class SendMail
	def self.send_mail(module_api_name, record_id)
		begin
			# Initialize SendMailOperations with record ID and module name
			send_mail_operations = ZOHOCRMSDK::SendMail::SendMailOperations.new(record_id, module_api_name)
			
			# Create the request body
			request = ZOHOCRMSDK::SendMail::BodyWrapper.new
			
			# Create email data array
			data_list = []
			
			# Create email data object
			email_data = ZOHOCRMSDK::SendMail::Data.new
			
			# Set sender information
			from_user = ZOHOCRMSDK::SendMail::From.new
			from_user.user_name = "Sender Name"
			from_user.email = "sender@example.com"
			email_data.from = from_user
			
			# Set recipient information (To)
			to_recipients = []
			to_user = ZOHOCRMSDK::SendMail::To.new
			to_user.user_name = "Recipient Name"
			to_user.email = "recipient@example.com"
			to_recipients.push(to_user)
			email_data.to = to_recipients
			
			# Set CC recipients (optional)
			cc_recipients = []
			cc_user = ZOHOCRMSDK::SendMail::Cc.new
			cc_user.user_name = "CC User"
			cc_user.email = "cc@example.com"
			cc_recipients.push(cc_user)
			email_data.cc = cc_recipients
			
			# Set reply-to (optional)
			reply_to_user = ZOHOCRMSDK::SendMail::To.new
			reply_to_user.user_name = "Reply To Name"
			reply_to_user.email = "replyto@example.com"
			email_data.reply_to = reply_to_user
			
			# Set email subject
			email_data.subject = "Test Email Subject"
			
			# Set email content
			email_data.content = "<p>Hello, this is a test email sent via Zoho CRM API.</p>"
			
			# Set mail format (text or html)
			email_data.mail_format = ZOHOCRMSDK::Util::Choice.new("html")
			
			# Set organization email flag
			email_data.org_email = false
			
			# Set scheduled time (optional)
			# email_data.scheduled_time = DateTime.new(2024, 12, 31, 10, 0, 0)
			
			# Add attachments (optional)
			attachments = []
			attachment = ZOHOCRMSDK::SendMail::Attachment.new
			attachment.id = "1055806000000123456"  # Replace with actual attachment ID
			attachments.push(attachment)
			email_data.attachments = attachments
			
			# Set template (optional)
			# template = ZOHOCRMSDK::SendMail::Template.new
			# email_data.template = template
			
			# Add consent email flag (optional)
			email_data.consent_email = true
			
			# Add linked record (optional)
			linked_record = ZOHOCRMSDK::SendMail::LinkedRecord.new
			linked_record.id = record_id
			linked_module = ZOHOCRMSDK::SendMail::LinkedModule.new
			linked_module.api_name = module_api_name
			linked_module.id = record_id
			linked_record.module = linked_module
			email_data.linked_record = linked_record
			
			# Add email data to array
			data_list.push(email_data)
			
			# Set data array to request
			request.data = data_list
			
			# Send the email
			response = send_mail_operations.send_mail(request)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::SendMail::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.data
						
						if action_responses != nil && action_responses.length > 0
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::SendMail::SuccessResponse
									success_response = action_response
									print "Email sent successfully!\n"
									print "Status: " + success_response.status.value.to_s + "\n"
									print "Code: " + success_response.code.value.to_s + "\n"
									print "Message: " + success_response.message + "\n"
									
									if success_response.details != nil
										print "Details:\n"
										success_response.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									
								elsif action_response.is_a? ZOHOCRMSDK::SendMail::APIException
									exception = action_response
									print "SendMail API Exception:\n"
									print "Status: " + exception.status.value.to_s + "\n"
									print "Code: " + exception.code.value.to_s + "\n"
									print "Message: " + exception.message + "\n"
									
									if exception.details != nil
										print "Error Details:\n"
										exception.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
								end
							end
						end
						
					elsif action_handler.is_a? ZOHOCRMSDK::SendMail::APIException
						exception = action_handler
						print "SendMail API Exception:\n"
						print "Status: " + exception.status.value.to_s + "\n"
						print "Code: " + exception.code.value.to_s + "\n"
						print "Message: " + exception.message + "\n"
						
						if exception.details != nil
							print "Error Details:\n"
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
					end
				else
					response_object = response.data_object
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
					end
				end
			end
			
		rescue ZOHOCRMSDK::SDKException => e
			print "SDKException:\n"
			print "Error Code: " + e.code.to_s + "\n"
			print "Error Message: " + e.message + "\n"
			
		rescue Exception => e
			print "Exception:\n"
			print "Error: " + e.message + "\n"
		end
	end
	
	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			
			# Set module and record details
			module_api_name = "Leads"  # Replace with your module name
			record_id = 1055806000000770001  # Replace with actual record ID
			
			send_mail(module_api_name, record_id)
		rescue Exception => e
			raise e
		end
	end
end

SendMail.initialize_and_call