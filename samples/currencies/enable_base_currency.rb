require "ZOHOCRMSDK8_0"

class EnableBaseCurrency
	def self.enable_base_currency
		currencies_operations = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
		
		base_currency_wrapper = ZOHOCRMSDK::Currencies::BaseCurrencyWrapper.new
		
		# Base currency to enable
		base_currency = ZOHOCRMSDK::Currencies::BaseCurrency.new
		base_currency.name = "Algerian Dinar - DZD"
		base_currency.iso_code = "DZD"
		base_currency.symbol = "DA"
		base_currency.exchange_rate = "20.0"
		
		# Currency format for Euro
		format1 = ZOHOCRMSDK::Currencies::Format.new
		format1.decimal_separator = ZOHOCRMSDK::Util::Choice.new("Period")
		format1.thousand_separator = ZOHOCRMSDK::Util::Choice.new("Comma")
		format1.decimal_places = ZOHOCRMSDK::Util::Choice.new("2")
		base_currency.format = format1
		
		base_currency_wrapper.base_currency = base_currency
		
		response = currencies_operations.enable_base_currency(base_currency_wrapper)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if response.is_expected
				action_handler = response.data_object
				
				if action_handler.is_a? ZOHOCRMSDK::Currencies::BaseCurrencyActionWrapper
					action_wrapper = action_handler
					base_currency_response = action_wrapper.base_currency
					
					if base_currency_response != nil
						if base_currency_response.is_a? ZOHOCRMSDK::Currencies::SuccessResponse
							success_response = base_currency_response
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
							
						elsif base_currency_response.is_a? ZOHOCRMSDK::Currencies::APIException
							exception = base_currency_response
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
					
				elsif action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
					exception = action_handler
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
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			enable_base_currency
		rescue Exception => e
			raise e
		end
	end
end

EnableBaseCurrency.initialize_and_call