require "ZOHOCRMSDK8_0"

class UpdateNotifications
	def self.update_notifications
		begin
			notifications_operations = ZOHOCRMSDK::Notifications::NotificationsOperations.new
			
			# Create the request body
			request = ZOHOCRMSDK::Notifications::BodyWrapper.new
			notifications_list = []
			
			# Update a specific notification by channel ID
			notification = ZOHOCRMSDK::Notifications::Notification.new
			notification.channel_id = "106800211"  # Replace with the actual channel ID to update
			notification.channel_expiry = DateTime.new(2026, 12, 31, 23, 59, 59)  # Extended expiry date
			notification.notify_url = "https://www.example.com/notifications/leads_single_updated"  # Updated notification URL
			notification.token = "TOKEN_FOR_VERIFICATION_OF_1068002"  # Updated token
			
			# Update events to watch for
			notification.events = ["Leads.create", "Leads.edit", "Leads.delete"]
			
			notifications_list.push(notification)
			
			request.watch = notifications_list
			
			response = notifications_operations.update_notifications(request)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.status_code == 204
					print "No Content\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Notifications::ActionWrapper
						action_wrapper = response_handler
						action_responses = action_wrapper.watch
						
						if action_responses != nil
							print "Notification Update Results:\n"
							
							action_responses.each_with_index do |action_response, index|
								print "\n--- Notification #{index + 1} Update Result ---\n"
								
								if action_response.is_a? ZOHOCRMSDK::Notifications::SuccessResponse
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
									
								elsif action_response.is_a? ZOHOCRMSDK::Notifications::APIException
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
							
							print "\nNotifications update process completed!\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Notifications::APIException
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
						print "Message: " + exception.message + "\n"
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
			update_notifications
		rescue Exception => e
			raise e
		end
	end
end

UpdateNotifications.initialize_and_call