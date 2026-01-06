require "ZOHOCRMSDK8_0"

class CreateVariables
	def self.create_variables
		begin
			# Initialize VariablesOperations
			variables_operations = ZOHOCRMSDK::Variables::VariablesOperations.new
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::Variables::BodyWrapper.new
			variables = []
			
			# Create first variable
			variable1 = ZOHOCRMSDK::Variables::Variable.new
			variable1.name = "TestVariable1"
			variable1.api_name = "TestVariable1"
			variable1.type = ZOHOCRMSDK::Util::Choice.new("text")
			variable1.value = "Sample Value 1"
			variable1.description = "Test variable for Ruby SDK"
			
			# Set variable group
			variable_group = ZOHOCRMSDK::Variables::VariableGroup.new
			variable_group.id = 1055806000003089001  # Replace with actual variable group ID
			variable1.variable_group = variable_group
			
			variables.push(variable1)
			
			# Create second variable
			variable2 = ZOHOCRMSDK::Variables::Variable.new
			variable2.name = "TestVariable2"
			variable2.api_name = "TestVariable2"
			variable2.type = ZOHOCRMSDK::Util::Choice.new("integer")
			variable2.value = 123
			variable2.description = "Test integer variable"
			variable2.variable_group = variable_group
			
			variables.push(variable2)
			
			body_wrapper.variables = variables
			
			response = variables_operations.create_variables(body_wrapper)
			
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
									print "Message: " + success_response.message.value + "\n"
									print "Code: " + success_response.code + "\n"
									
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
			create_variables
		rescue Exception => e
			raise e
		end
	end
end

CreateVariables.initialize_and_call