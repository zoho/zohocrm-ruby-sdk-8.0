require "ZOHOCRMSDK8_0"

class DeleteNotification
	def self.delete_notification
		begin
			notifications_operations = ZOHOCRMSDK::Notifications::NotificationsOperations.new
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::DeleteNotificationParam.channel_ids, "106800211123")
			
			# Optional: Filter by module to delete notifications for specific modules
			# param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::DeleteNotificationParam.module_1, "Leads")
			response = notifications_operations.delete_notification(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.status_code == 204
					print "Notifications successfully deleted (No Content returned)\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Notifications::ActionWrapper
						action_wrapper = response_handler
						action_responses = action_wrapper.watch
						
						if action_responses != nil
							print "Notification Delete Results:\n"
							
							action_responses.each_with_index do |action_response, index|
								print "\n--- Notification #{index + 1} Delete Result ---\n"
								
								if action_response.is_a? ZOHOCRMSDK::Notifications::SuccessResponse
									success_response = action_response
									print "Delete Successful!\n"
									print "Status: " + success_response.status.value + "\n"
									print "Code: " + success_response.code.value + "\n"
									print "Message: " + success_response.message.value + "\n"
									
									# Display delete details
									if success_response.details != nil
										print "Delete Details:\n"
										success_response.details.each do |key, value|
											if key == "channel_id"
												print "  Deleted Channel ID: " + value.to_s + "\n"
											elsif key == "resource_name"
												print "  Module: " + value.to_s + "\n"
											elsif key == "deleted_time"
												print "  Deleted At: " + value.to_s + "\n"
											elsif key == "deleted_count"
												print "  Total Notifications Deleted: " + value.to_s + "\n"
											else
												print "  " + key + ": " + value.to_s + "\n"
											end
										end
									end
									
								elsif action_response.is_a? ZOHOCRMSDK::Notifications::APIException
									exception = action_response
									print "Delete Failed!\n"
									print "Status: " + exception.status.value + "\n"
									print "Code: " + exception.code.value + "\n"
									print "Message: " + exception.message + "\n"
									
									if exception.details != nil
										print "Error Details:\n"
										exception.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
								end
							end
							
							print "\nNotifications delete process completed!\n"
						else
							print "No action responses received\n"
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
			delete_notification
		rescue Exception => e
			raise e
		end
	end
end

DeleteNotification.initialize_and_call