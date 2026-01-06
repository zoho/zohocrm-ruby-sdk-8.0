require "ZOHOCRMSDK8_0"

class GetVariables
	def self.get_variables
		begin
			# Initialize VariablesOperations
			variables_operations = ZOHOCRMSDK::Variables::VariablesOperations.new
			
			# Create ParameterMap for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			# param_instance.add(ZOHOCRMSDK::Variables::VariablesOperations::GetVariablesParam.group, "General")
			
			response = variables_operations.get_variables(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No variables found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Variables::ResponseWrapper
						response_wrapper = response_handler
						variables = response_wrapper.variables
						if variables != nil && variables.length > 0
							variables.each_with_index do |variable, index|
								if variable.id != nil
									print "  ID: " + variable.id.to_s + "\n"
								end
								
								if variable.name != nil
									print "  Name: " + variable.name + "\n"
								end
								
								if variable.api_name != nil
									print "  API Name: " + variable.api_name + "\n"
								end
								
								if variable.type != nil
									print "  Type: " + variable.type.value + "\n"
								end
								
								if variable.value != nil
									print "  Value: " + variable.value.to_s + "\n"
								end
								
								if variable.description != nil
									print "  Description: " + variable.description + "\n"
								end
								
								if variable.variable_group != nil
									print "  Variable Group: " + variable.variable_group.api_name + " (" + variable.variable_group.id.to_s + ")\n"
								end
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Variables::APIException
						exception = response_handler
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
			get_variables
		rescue Exception => e
			raise e
		end
	end
end

GetVariables.initialize_and_call