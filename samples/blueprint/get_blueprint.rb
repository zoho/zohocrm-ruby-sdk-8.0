require "ZOHOCRMSDK8_0"

class GetBlueprint
	def self.get_blueprint
		record_id = "1055806000028754070"
		module_api_name = "Leads"
		
		blueprint_operations = ZOHOCRMSDK::Blueprint::BlueprintOperations.new(record_id, module_api_name)
		
		response = blueprint_operations.get_blueprint
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::Blueprint::ResponseWrapper
					response_wrapper = response_handler
					blueprint = response_wrapper.blueprint
					
					if blueprint != nil
						print "Blueprint Details:\n"
						if blueprint.process_info != nil
							process_info = blueprint.process_info
							print "Process Information:\n"
							
							if process_info.field_id != nil
								print "  Field ID: " + process_info.field_id.to_s + "\n"
							end
							
							if process_info.is_continuous != nil
								print "  Is Continuous: " + process_info.is_continuous.to_s + "\n"
							end
							
							if process_info.api_name != nil
								print "  API Name: " + process_info.api_name + "\n"
							end
							
							if process_info.continuous != nil
								print "  Continuous: " + process_info.continuous.to_s + "\n"
							end
							
							if process_info.field_label != nil
								print "  Field Label: " + process_info.field_label + "\n"
							end
							
							if process_info.name != nil
								print "  Process Name: " + process_info.name + "\n"
							end
							
							if process_info.column_name != nil
								print "  Column Name: " + process_info.column_name + "\n"
							end
							
							if process_info.field_value != nil
								print "  Field Value: " + process_info.field_value + "\n"
							end
							
							if process_info.id != nil
								print "  Process ID: " + process_info.id.to_s + "\n"
							end
							
							if process_info.field_name != nil
								print "  Field Name: " + process_info.field_name + "\n"
							end
							print "\n"
						end
						
						transitions = blueprint.transitions
						if transitions != nil && transitions.length > 0
							transitions.each_with_index do |transition, index|
								print "Transition #{index + 1}:\n"
								
								if transition.next_transitions != nil && transition.next_transitions.length > 0
									print "  Next Transitions: " + transition.next_transitions.join(", ") + "\n"
								end
								
								if transition.percent_partial_save != nil
									print "  Percent Partial Save: " + transition.percent_partial_save.to_s + "\n"
								end
								
								data = transition.data
								if data != nil
									print data.get_key_values.empty? ? "  No Data\n" : "  Data:\n"
									data.get_key_values.each do |key, value|
										print "    #{key}: #{value}\n"
									end
								end
								
								if transition.next_field_value != nil
									print "  Next Field Value: " + transition.next_field_value + "\n"
								end
								
								if transition.name != nil
									print "  Transition Name: " + transition.name + "\n"
								end
								
								criteria_matched = transition.criteria_matched
								if criteria_matched != nil
									print "  Criteria Matched: " + criteria_matched.to_s + "\n"
								end
								
								if transition.id != nil
									print "  Transition ID: " + transition.id.to_s + "\n"
								end
								
								fields = transition.fields
								if fields != nil && fields.length > 0
									print "  Fields (#{fields.length}):\n"
									fields.each do |field|
										if field.display_label != nil
											print "    - Display Label: " + field.display_label + "\n"
										end
										if field.data_type != nil
											print "      Data Type: " + field.data_type + "\n"
										end
										if field.column_name != nil
											print "      Column Name: " + field.column_name + "\n"
										end
										if field.api_name != nil
											print "      API Name: " + field.api_name + "\n"
										end
										if field.id != nil
											print "      Field ID: " + field.id.to_s + "\n"
										end
										if field.mandatory != nil
											print "      Mandatory: " + field.mandatory.to_s + "\n"
										end
									end
								end
								
								if transition.criteria_message != nil
									print "  Criteria Message: " + transition.criteria_message + "\n"
								end
								
								if transition.type != nil
									print "  Type: " + transition.type + "\n"
								end
								
								if transition.execution_time != nil
									print "  Execution Time: " + transition.execution_time.to_s + "\n"
								end
							end
						end
						
						print "\nBlueprint Summary:\n"
						if process_info != nil
							print "Process: #{process_info.name}\n" if process_info.name != nil
							print "Field: #{process_info.field_label}\n" if process_info.field_label != nil
						end
					end
				elsif response_handler.is_a? ZOHOCRMSDK::Blueprint::APIException
					exception = response_handler
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
				
			elsif response.status_code != 204
				response_object = response.data_object
				response_object.instance_variables.each do |field|
					print field.to_s + "\n"
					print response_object.instance_variable_get(field).to_s + "\n"
				end
			end
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_blueprint
		rescue Exception => e
			raise e
		end
	end
end

GetBlueprint.initialize_and_call
