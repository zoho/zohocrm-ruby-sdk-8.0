require "ZOHOCRMSDK8_0"

class UpdateCurrencies
	def self.update_currencies
		currencies_operations = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
		
		body_wrapper = ZOHOCRMSDK::Currencies::BodyWrapper.new
		currencies_list = []
		
		# First currency update - Update Euro exchange rate
		currency1 = ZOHOCRMSDK::Currencies::Currency.new
		currency1.id = 554023000000789001  # Replace with actual currency ID
		currency1.exchange_rate = "0.88"  # Updated exchange rate
		
		currencies_list.push(currency1)
		
		# Second currency update - Update Japanese Yen
		currency2 = ZOHOCRMSDK::Currencies::Currency.new
		currency2.id = 554023000000789002  # Replace with actual currency ID
		currency2.exchange_rate = "115.0"  # Updated exchange rate
		
		# Update currency format
		format2 = ZOHOCRMSDK::Currencies::Format.new
		format2.decimal_separator = ZOHOCRMSDK::Util::Choice.new("Period")
		format2.thousand_separator = ZOHOCRMSDK::Util::Choice.new("Comma")
		format2.decimal_places = ZOHOCRMSDK::Util::Choice.new("2")
		currency2.format = format2
		
		currencies_list.push(currency2)
		
		body_wrapper.currencies = currencies_list
		
		response = currencies_operations.update_currencies(body_wrapper)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if response.is_expected
				action_handler = response.data_object
				
				if action_handler.is_a? ZOHOCRMSDK::Currencies::ActionWrapper
					action_wrapper = action_handler
					action_responses = action_wrapper.currencies
					
					if action_responses != nil
						action_responses.each_with_index do |action_response, index|
							if action_response.is_a? ZOHOCRMSDK::Currencies::SuccessResponse
								success_response = action_response
								print "Operation: SUCCESS\n"
								
								if success_response.status != nil
									print "Status: " + success_response.status.value + "\n"
								end
								
								if success_response.code != nil
									print "Code: " + success_response.code.value + "\n"
								end
								
								if success_response.message != nil
									print "Message: " + success_response.message.value + "\n"
								end
								
								if success_response.details != nil
									print "Details:\n"
									success_response.details.each do |key, value|
										print "  " + key + ": " + value.to_s + "\n"
									end
								end
								
							elsif action_response.is_a? ZOHOCRMSDK::Currencies::APIException
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
					end
					
				elsif action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
					exception = action_handler
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
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			update_currencies
		rescue Exception => e
			raise e
		end
	end
end

UpdateCurrencies.initialize_and_call