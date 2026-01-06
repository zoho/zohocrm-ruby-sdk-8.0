require "ZOHOCRMSDK8_0"

class UpdateVariableById
	def self.update_variable_by_id(variable_id)
		begin
			# Initialize VariablesOperations
			variables_operations = ZOHOCRMSDK::Variables::VariablesOperations.new
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::Variables::BodyWrapper.new
			variables = []
			
			# Create variable to update
			variable = ZOHOCRMSDK::Variables::Variable.new
			variable.value = 23
			variable.description = "Updated description for single variable"
			
			variables.push(variable)
			body_wrapper.variables = variables
			
			# Create ParameterMap for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			# param_instance.add(ZOHOCRMSDK::Variables::VariablesOperations::UpdateVariableByIDParam.group, "General")
			
			response = variables_operations.update_variable_by_id(variable_id, body_wrapper, param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::Variables::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.variables
						
						if action_responses != nil
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::Variables::SuccessResponse
									success_response = action_response
									print "Status: " + success_response.status.value + "\n"
									print "Message: " + success_response.message + "\n"
									print "Code: " + success_response.code.value + "\n"
									
									if success_response.details != nil
										print "Details:\n"
										success_response.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									
								elsif action_response.is_a? ZOHOCRMSDK::Variables::APIException
									exception = action_response
									print "Status: " + exception.status.value + "\n"
									print "Code: " + exception.code.value + "\n"
									print "Message: " + exception.message + "\n"
									
									if exception.details != nil
										print "Error Details:\n"
										exception.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
								end
							end
						end
						
					elsif action_handler.is_a? ZOHOCRMSDK::Variables::APIException
						exception = action_handler
						print "Variables API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Message: " + exception.message + "\n"
						
						if exception.details != nil
							print "Error Details:\n"
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
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
			
			# Replace with actual variable ID
			variable_id = 1055806000018935002
			update_variable_by_id(variable_id)
		rescue Exception => e
			raise e
		end
	end
end

UpdateVariableById.initialize_and_call