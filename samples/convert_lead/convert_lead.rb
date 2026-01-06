require "ZOHOCRMSDK8_0"

class ConvertLead
	def self.convert_lead(lead_id)
		begin
			# Initialize ConvertLeadOperations with the lead_id
			convert_lead_operations = ZOHOCRMSDK::ConvertLead::ConvertLeadOperations.new(lead_id)
			
			# Create the request body
			body_wrapper = ZOHOCRMSDK::ConvertLead::BodyWrapper.new
			lead_converter = ZOHOCRMSDK::ConvertLead::LeadConverter.new
			lead_converter.overwrite = true
			lead_converter.notify_lead_owner = true
			lead_converter.notify_new_entity_owner = true

			deals = ZOHOCRMSDK::Record::Record.new
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Deal_name, "Ruby SDK Deal")
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Closing_date, Date.new(2024, 12, 31))
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Stage, ZOHOCRMSDK::Util::Choice.new("Qualification"))
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Amount, 5000.0)
			deals.add_field_value(ZOHOCRMSDK::Record::Field::Deals.Pipeline, ZOHOCRMSDK::Util::Choice.new("Qualification"))
			lead_converter.deals = deals
			
			contacts = ZOHOCRMSDK::Record::Record.new
			contacts.id = 3477064004
			lead_converter.contacts = contacts
			
			accounts = ZOHOCRMSDK::Record::Record.new
			accounts.id = 3477064004
			lead_converter.accounts = accounts
			
			body_wrapper.data = [lead_converter]
			response = convert_lead_operations.convert_lead(body_wrapper)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::ConvertLead::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.data
						
						if action_responses != nil && action_responses.length > 0
							action_responses.each_with_index do |action_response, index|
								print "\nResponse #{index + 1}:\n"
								
								if action_response.is_a? ZOHOCRMSDK::ConvertLead::SuccessResponse
									success_response = action_response
									print "Status: " + success_response.status.value + "\n"
									print "Code: " + success_response.code.value + "\n"
									print "Message: " + success_response.message.value + "\n"
									
									if success_response.details != nil
										print "Details:\n"
										success_response.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									
								elsif action_response.is_a? ZOHOCRMSDK::ConvertLead::APIException
									exception = action_response
									print "Status: " + exception.status.value + "\n"
									print "Code: " + exception.code.value + "\n"
									print "Message: " + exception.message.value + "\n"
									
									if exception.details != nil
										print "Error Details:\n"
										exception.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
								end
							end
						end
						
					elsif action_handler.is_a? ZOHOCRMSDK::ConvertLead::APIException
						exception = action_handler
						print "API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Message: " + exception.message.value + "\n"
						
						if exception.details != nil
							print "Error Details:\n"
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
					end
				else
					response_object = response.data_object
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
					end
				end
			end
			
		rescue ZOHOCRMSDK::SDKException => e
			print "SDKException:\n"
			print "Error Code: " + e.code.to_s + "\n"
			print "Error Message: " + e.message + "\n"
			
		rescue Exception => e
			print "Exception:\n"
			print e.message + "\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			
			lead_id = 1055806000028884052 # Replace with actual lead ID
			convert_lead(lead_id)
			
		rescue Exception => e
			raise e
		end
	end
end

ConvertLead.initialize_and_call