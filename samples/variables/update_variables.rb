require "ZOHOCRMSDK8_0"

class UpdateVariables
	def self.update_variables
		begin
			# Initialize VariablesOperations
			variables_operations = ZOHOCRMSDK::Variables::VariablesOperations.new
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::Variables::BodyWrapper.new
			variables = []
			
			# Update first variable
			variable1 = ZOHOCRMSDK::Variables::Variable.new
			variable1.id = 1055806000018935002  # Replace with actual variable ID
			variable1.value = 25
			variable1.description = "Updated description for variable 1"
			
			variables.push(variable1)
			
			# Update second variable
			variable2 = ZOHOCRMSDK::Variables::Variable.new
			variable2.id = 1055806000003127002  # Replace with actual variable ID
			variable2.value = 456
			variable2.description = "Updated integer variable"
			
			variables.push(variable2)
			
			body_wrapper.variables = variables
			
			response = variables_operations.update_variables(body_wrapper)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::Variables::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.variables
						
						if action_responses != nil
							print "Variables Update Results:\n"
							print "=" * 40 + "\n"
							
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::Variables::SuccessResponse
									success_response = action_response
									print "Variable " + (index + 1).to_s + " Updated Successfully:\n"
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
									print "Variable " + (index + 1).to_s + " Update Failed:\n"
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
								print "-" * 30 + "\n"
							end
						end
						
					elsif action_handler.is_a? ZOHOCRMSDK::Variables::APIException
						exception = action_handler
						print "Variables API Exception:\n"
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
			update_variables
		rescue Exception => e
			raise e
		end
	end
end

UpdateVariables.initialize_and_call