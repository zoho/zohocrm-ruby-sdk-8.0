require "ZOHOCRMSDK8_0"

class GetAssignmentRule
	def self.get_assignment_rule
		id = 1055806000018924001
		param_instance = ZOHOCRMSDK::ParameterMap.new
		param_instance.add(ZOHOCRMSDK::AssignmentRules::AssignmentRulesOperations::GetAssignmentRuleParam.module_1, "Leads")
		assignment_rules_operations = ZOHOCRMSDK::AssignmentRules::AssignmentRulesOperations.new
		response = assignment_rules_operations.get_assignment_rule(id, param_instance)
		if response != nil
			print "status Code: " + response.status_code.to_s + "\n"
			if response.status_code == 204
				print "no Content".to_s + "\n"
				return
			end
			if response.is_expected
				response_handler = response.data_object
				if response_handler.is_a? ZOHOCRMSDK::AssignmentRules::ResponseWrapper
					response_wrapper = response_handler
					assignment_rules = response_wrapper.assignment_rules
					if assignment_rules != nil
						assignment_rules.each do |assignment_rule|
							print "AssignmentRule ID: " + assignment_rule.id.to_s + "\n"
							print "AssignmentRule Name: " + assignment_rule.name.to_s + "\n"
							print "AssignmentRule API Name: " + assignment_rule.api_name.to_s + "\n"
							print "AssignmentRule Description: " + assignment_rule.description.to_s + "\n"
							print "AssignmentRule Created Time: " + assignment_rule.created_time.to_s + "\n"
							print "AssignmentRule Modified Time: " + assignment_rule.modified_time.to_s + "\n"
							
							default_assignee = assignment_rule.default_assignee
							if default_assignee != nil
								print "Default Assignee ID: " + default_assignee.id.to_s + "\n"
								print "Default Assignee Name: " + default_assignee.name.to_s + "\n"
							end
							
							created_by = assignment_rule.created_by
							if created_by != nil
								print "Created By ID: " + created_by.id.to_s + "\n"
								print "Created By Name: " + created_by.name.to_s + "\n"
								print "Created By Email: " + created_by.email.to_s + "\n"
							end
							
							modified_by = assignment_rule.modified_by
							if modified_by != nil
								print "Modified By ID: " + modified_by.id.to_s + "\n"
								print "Modified By Name: " + modified_by.name.to_s + "\n"
								print "Modified By Email: " + modified_by.email.to_s + "\n"
							end
							
							module_info = assignment_rule.module
							if module_info != nil
								print "Module API Name: " + module_info.api_name.to_s + "\n"
								print "Module ID: " + module_info.id.to_s + "\n"
							end
						end
					end
				elsif response_handler.is_a? ZOHOCRMSDK::AssignmentRules::APIException
					exception = response_handler
					print "status: " + exception.status.value.to_s + "\n"
					print "code: " + exception.code.value.to_s + "\n"
					print "details: ".to_s
					exception.details.each do |k, v|
						print k + ": " + v.to_s
					end
					print "message: " + exception.message.to_s + "\n"
				end
			elsif response.status_code != 204
				response_object = response.data_object
				response_object.instance_variables.each do |field_1|
					print field_1
					print "\n"
					print response_object.instance_variable_get(field_1)
				end
			end
		end
	end
	
	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_assignment_rule
		rescue Exception => e
			raise e
		end
	end
end
GetAssignmentRule.initialize_and_call