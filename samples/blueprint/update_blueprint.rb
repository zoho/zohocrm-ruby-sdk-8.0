require "ZOHOCRMSDK8_0"

class UpdateBlueprint
	def self.update_blueprint
		record_id = "1055806000028754070"
		module_api_name = "Leads"
		
		blueprint_operations = ZOHOCRMSDK::Blueprint::BlueprintOperations.new(record_id, module_api_name)
		body_wrapper = ZOHOCRMSDK::Blueprint::BodyWrapper.new
		
		blueprint = ZOHOCRMSDK::Blueprint::BluePrint.new
		blueprint.transition_id = "1055806000000173093"
		
		data = ZOHOCRMSDK::Record::Record.new
		data.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Lead_status, ZOHOCRMSDK::Util::Choice.new("Contacted"))
		data.add_key_value("Annual_Revenue", 1000000.0)
		data.add_key_value("No_of_employees", 50)
		
		blueprint.data = data
		
		body_wrapper.blueprint = [blueprint]
		
		response = blueprint_operations.update_blueprint(body_wrapper)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if response.status_code == 204
				print "No Content\n"
				return
			end
			
			if response.is_expected
				action_handler = response.data_object
				
				if action_handler.is_a? ZOHOCRMSDK::Blueprint::ActionWrapper
					action_wrapper = action_handler
					action_responses = action_wrapper.blueprint
					
					if action_responses != nil
						action_responses.each_with_index do |action_response, index|
							if action_response.is_a? ZOHOCRMSDK::Blueprint::SuccessResponse
								success_response = action_response
								print "  Status: " + success_response.status.value + "\n"
								print "  Code: " + success_response.code.value + "\n"
								print "  Details: \n"
								if success_response.details != nil
									success_response.details.each do |key, value|
										print "    " + key + ": " + value.to_s + "\n"
									end
								end
								print "  Message: " + success_response.message.value + "\n"
								
							elsif action_response.is_a? ZOHOCRMSDK::Blueprint::APIException
								exception = action_response
								print "  Status: " + exception.status.value + "\n"
								print "  Code: " + exception.code.value + "\n"
								print "  Details: \n"
								if exception.details != nil
									exception.details.each do |key, value|
										print "    " + key + ": " + value.to_s + "\n"
									end
								end
								print "  Message: " + exception.message.value + "\n"
							end
						end
					end
				elsif action_response.is_a? ZOHOCRMSDK::Blueprint::SuccessResponse
					success_response = action_response
					print "  Status: " + success_response.status.value + "\n"
					print "  Code: " + success_response.code.value + "\n"
					print "  Details: \n"
					if success_response.details != nil
						success_response.details.each do |key, value|
							print "    " + key + ": " + value.to_s + "\n"
						end
					end
					print "  Message: " + success_response.message.value + "\n"
				elsif action_handler.is_a? ZOHOCRMSDK::Blueprint::APIException
					exception = action_handler
					print "API Exception:\n"
					print "Status: " + exception.status.value + "\n"
					print "Code: " + exception.code.value + "\n"
					print "Details: \n"
					if exception.details != nil
						exception.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
					print "Message: " + exception.message.value + "\n"
				end
			
			else
				print "HTTP Error Code: " + response.status_code.to_s + "\n"
				response_object = response.data_object
				if response_object != nil
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
					end
				end
			end
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			update_blueprint
		rescue Exception => e
			raise e
		end
	end
end

UpdateBlueprint.initialize_and_call
