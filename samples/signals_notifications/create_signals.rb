require "ZOHOCRMSDK8_0"

class CreateSignals
		def self.create_signals
	signals_notifications_operations =  ZOHOCRMSDK::SignalsNotifications::SignalsNotificationsOperations.new
			body_wrapper =  ZOHOCRMSDK::SignalsNotifications::BodyWrapper.new
			signals=[]
			signal =  ZOHOCRMSDK::SignalsNotifications::Signals.new
			signal.signal_namespace="mailchimp.open"
			signal.subject="Ruby SDK Test"
			signal.id = 34770605001
			signal.module="Leads"
			signal.message="This is SDK sample code"
			signals.push(signal)
			body_wrapper.signals = signals
			response = signals_notifications_operations.create_signals(body_wrapper)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::SignalsNotifications::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.signals
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::SignalsNotifications::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::SignalsNotifications::APIException
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
					elsif action_handler.is_a? ZOHOCRMSDK::SignalsNotifications::APIException
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
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				create_signals
			rescue Exception => e
				raise e
			end
		end
end
CreateSignals.initialize_and_call