require "ZOHOCRMSDK8_0"

class CancelMeetings
	def self.cancel_meetings(event_id)
		cancel_meetings_operations = ZOHOCRMSDK::CancelMeetings::CancelMeetingsOperations.new(event_id)
		request = ZOHOCRMSDK::CancelMeetings::BodyWrapper.new
		
		# Create notify data
		notify_data = []
		notify = ZOHOCRMSDK::CancelMeetings::Notify.new
		notify.send_cancelling_mail = true
		notify_data.push(notify)
		
		request.data = notify_data
		
		response = cancel_meetings_operations.cancel_meetings(request)
		if response != nil
			print "status Code: " + response.status_code.to_s
			if response.is_expected
				action_handler = response.data_object
				if action_handler.is_a? ZOHOCRMSDK::CancelMeetings::ActionWrapper
					action_wrapper = action_handler
					action_responses = action_wrapper.data
					action_responses.each do |action_response|
						if action_response.is_a? ZOHOCRMSDK::CancelMeetings::SuccessResponse
							success_response = action_response
							print "status: " + success_response.status.value.to_s + "\n"
							print "code: " + success_response.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							success_response.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + success_response.message.to_s
						elsif action_response.is_a? ZOHOCRMSDK::CancelMeetings::APIException
							exception = action_response
							print "status: " + exception.status.value.to_s + "\n"
							print "code: " + exception.code.value.to_s + "\n"
							print "details: ".to_s + "\n"
							exception.details.each do |k, v|
								print k + ": " + v.to_s + "\n"
							end
							print "message: " + exception.message.to_s + "\n"
						end
					end
				elsif action_handler.is_a? ZOHOCRMSDK::CancelMeetings::APIException
					exception = action_handler
					print "status: " + exception.status.value.to_s + "\n"
					print "code: " + exception.code.value.to_s + "\n"
					print "details: ".to_s + "\n"
					exception.details.each do |k, v|
						print k + ": " + v.to_s + "\n"
					end
					print "message: " + exception.message.to_s + "\n"
				end
			else
				response_object = response.data_object
				response_object.instance_variables.each do |field_1|
					print field_1
					print "\n"
					print response_object.instance_variable_get(field_1)
				end
			end
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			event_id = 1055806000016709021  # Replace with actual event ID
			cancel_meetings(event_id)
		rescue Exception => e
			raise e
		end
	end
end

CancelMeetings.initialize_and_call