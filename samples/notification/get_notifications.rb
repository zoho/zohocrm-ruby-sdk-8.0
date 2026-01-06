require "ZOHOCRMSDK8_0"

class GetNotifications
	def self.get_notifications
		begin
			notifications_operations = ZOHOCRMSDK::Notifications::NotificationsOperations.new
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Add optional parameters
			# param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::GetNotificationsParam.page, 1)
			# param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::GetNotificationsParam.per_page, 200)
			# param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::GetNotificationsParam.channel_id, "1055806000000691001")
			# param_instance.add(ZOHOCRMSDK::Notifications::NotificationsOperations::GetNotificationsParam.module_1, "Leads")
			
			response = notifications_operations.get_notifications(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Notifications::ResponseWrapper
						response_wrapper = response_handler
						notifications_list = response_wrapper.watch
						
						if notifications_list != nil && notifications_list.length > 0
							print "Total Notifications: " + notifications_list.length.to_s + "\n"
							
							notifications_list.each_with_index do |notification, index|
								print "\n--- Notification #{index + 1} ---\n"
								
								# Basic notification information
								if notification.channel_id != nil
									print "  Channel ID: " + notification.channel_id.to_s + "\n"
								end
								
								if notification.resource_uri != nil
									print "  Resource URI: " + notification.resource_uri + "\n"
								end
								
								if notification.resource_id != nil
									print "  Resource ID: " + notification.resource_id.to_s + "\n"
								end
								
								if notification.resource_name != nil
									print "  Resource Name: " + notification.resource_name + "\n"
								end
								
								# Channel expiry information
								if notification.channel_expiry != nil
									print "  Channel Expiry: " + notification.channel_expiry.to_s + "\n"
								end
								
								# Token information
								if notification.token != nil
									print "  Token: " + notification.token + "\n"
								end
								
								# Notification URL
								if notification.notify_url != nil
									print "  Notify URL: " + notification.notify_url + "\n"
								end
								
								# Events information
								if notification.events != nil && notification.events.length > 0
									print "  Events (#{notification.events.length}):\n"
									notification.events.each_with_index do |event, event_index|
										print "    #{event_index + 1}. " + event + "\n"
									end
								end
								
								# Fields information (if any)
								if notification.fields != nil && notification.fields.respond_to?(:each)
									print "  Watched Fields:\n"
									notification.fields.each do |field_name, field_value|
										print "    " + field_name + ": " + field_value.to_s + "\n"
									end
								end
							end
						else
							print "No notifications found.\n"
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
			get_notifications
		rescue Exception => e
			raise e
		end
	end
end

GetNotifications.initialize_and_call