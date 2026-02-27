require "ZOHOCRMSDK8_0"

class UpdateCurrency
	def self.update_currency
		# Replace with actual currency ID
		currency_id = 554023000000789001
		
		currencies_operations = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
		
		body_wrapper = ZOHOCRMSDK::Currencies::BodyWrapper.new
		currencies_list = []
		
		# Currency to update
		currency = ZOHOCRMSDK::Currencies::Currency.new
		currency.exchange_rate = "0.92"  # Updated exchange rate
		currency.is_active = true      # Activate currency
		
		# Update currency format
		format = ZOHOCRMSDK::Currencies::Format.new
		format.decimal_separator = ZOHOCRMSDK::Util::Choice.new("Period")
		format.thousand_separator = ZOHOCRMSDK::Util::Choice.new("Comma")
		format.decimal_places = ZOHOCRMSDK::Util::Choice.new("2")
		currency.format = format
		
		currencies_list.push(currency)
		body_wrapper.currencies = currencies_list
		
		response = currencies_operations.update_currency(currency_id, body_wrapper)
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
			update_currency
		rescue Exception => e
			raise e
		end
	end
end

UpdateCurrency.initialize_and_call