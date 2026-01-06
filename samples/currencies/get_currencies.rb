require "ZOHOCRMSDK8_0"

class GetCurrencies
	def self.get_currencies
		currencies_operations = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
		
		response = currencies_operations.get_currencies
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::Currencies::ResponseWrapper
					response_wrapper = response_handler
					currencies_list = response_wrapper.currencies
					
					if currencies_list != nil && currencies_list.length > 0
						
						currencies_list.each_with_index do |currency, index|
							
							# Basic currency information
							if currency.id != nil
								print "  Currency ID: " + currency.id.to_s + "\n"
							end
							
							if currency.iso_code != nil
								print "  ISO Code: " + currency.iso_code + "\n"
							end
							
							if currency.symbol != nil
								print "  Symbol: " + currency.symbol + "\n"
							end
							
							if currency.created_time != nil
								print "  Created Time: " + currency.created_time.to_s + "\n"
							end
							
							if currency.modified_time != nil
								print "  Modified Time: " + currency.modified_time.to_s + "\n"
							end
							
							# Currency display name and format
							if currency.name != nil
								print "  Display Name: " + currency.name + "\n"
							end
							# Currency status and properties
							if currency.is_active != nil
								print "  Is Active: " + currency.is_active.to_s + "\n"
							end
							
							if currency.is_base != nil
								print "  Is Base Currency: " + currency.is_base.to_s + "\n"
							end
							
							if currency.exchange_rate != nil
								print "  Exchange Rate: " + currency.exchange_rate.to_s + "\n"
							end
							
							# Currency format details
							if currency.format != nil
								format = currency.format
								print "  Format Details:\n"
								
								if format.decimal_separator != nil
									print "    Decimal Separator: " + format.decimal_separator.value + "\n"
								end
								
								if format.thousand_separator != nil
									print "    Thousand Separator: " + format.thousand_separator.value + "\n"
								end
								
								if format.decimal_places != nil
									print "    Decimal Places: " + format.decimal_places.value + "\n"
								end
							end
							
							# User information
							if currency.created_by != nil
								user = currency.created_by
								print "  Created By:\n"
								
								if user.id != nil
									print "    User ID: " + user.id.to_s + "\n"
								end
								
								if user.name != nil
									print "    User Name: " + user.name + "\n"
								end
							end
							
							if currency.modified_by != nil
								user = currency.modified_by
								print "  Modified By:\n"
								
								if user.id != nil
									print "    User ID: " + user.id.to_s + "\n"
								end
								
								if user.name != nil
									print "    User Name: " + user.name + "\n"
								end
							end
						end
					else
						print "No currencies found in the organization.\n"
					end
					
				elsif response_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_currencies
		rescue Exception => e
			raise e
		end
	end
end

GetCurrencies.initialize_and_call