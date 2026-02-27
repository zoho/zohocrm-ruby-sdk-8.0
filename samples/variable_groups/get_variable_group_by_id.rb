require "ZOHOCRMSDK8_0"

class GetVariableGroupById
	def self.get_variable_group_by_id(variable_group_id)
		begin
			# Initialize VariableGroupsOperations
			variable_groups_operations = ZOHOCRMSDK::VariableGroups::VariableGroupsOperations.new
			
			response = variable_groups_operations.get_variable_group_by_id(variable_group_id)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - Variable group not found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::VariableGroups::ResponseWrapper
						response_wrapper = response_handler
						variable_groups = response_wrapper.variable_groups
						if variable_groups != nil && variable_groups.length > 0
							variable_group = variable_groups[0]
							if variable_group.id != nil
								print "  ID: " + variable_group.id.to_s + "\n"
							end
							
							if variable_group.name != nil
								print "  Name: " + variable_group.name + "\n"
							end
							if variable_group.api_name != nil
								print "  API Name: " + variable_group.api_name + "\n"
							end
							
							if variable_group.display_label != nil
								print "  Display Label: " + variable_group.display_label + "\n"
							end
							
							if variable_group.description != nil
								print "  Description: " + variable_group.description + "\n"
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::VariableGroups::APIException
						exception = response_handler
						print "VariableGroups API Exception:\n"
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
			
			# Replace with actual variable group ID
			variable_group_id = "1055806000003089001"
			get_variable_group_by_id(variable_group_id)
		rescue Exception => e
			raise e
		end
	end
end

GetVariableGroupById.initialize_and_call