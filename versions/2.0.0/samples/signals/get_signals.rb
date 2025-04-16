require "ZOHOCRMSDK8_0"

class GetSignals
		def self.get_signals
			signals_operations =  ZOHOCRMSDK::Signals::SignalsOperations.new
			response = signals_operations.get_signals
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Signals::ResponseWrapper
						response_wrapper = response_handler
						signals= response_wrapper.signals
						signals.each do |signal|
							print "signals DisplayLabel: " + signal.display_label.to_s + "\n"
							extension = signal.extension
							if extension != nil
								print "signals Extension DisplayLabel: " + extension.display_label.to_s + "\n"
								print "signals Extension Namespace: " + extension.namespace.to_s + "\n"
								print "signals Extension Id: " + extension.id.to_s + "\n"
								print "signals Extension Type: " + extension.type.to_s + "\n"
							end
							feature_availability = signal.feature_availability
							if feature_availability != nil
								print "signals FeatureAvailability Scoring: " + feature_availability.scoring.to_s + "\n"
								print "signals FeatureAvailability Signals: " + feature_availability.signals.to_s + "\n"
							end
							print "signals Namespace: " + signal.namespace.to_s + "\n"
							print "signals ChatEnabled: " + signal.chat_enabled.to_s + "\n"
							print "signals Id: " + signal.id.to_s + "\n"
							print "signals Enabled: " + signal.enabled.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Signals::APIException
						exception = response_handler
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
				get_signals
			rescue Exception => e
				raise e
			end
		end
end
GetSignals.initialize_and_call