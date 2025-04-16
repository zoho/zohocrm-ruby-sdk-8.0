require "ZOHOCRMSDK8_0"

class SearchSharingRulesSummary
		def self.search_sharing_rules_summary(module_api_name)
			sharing_rules_operations = ZOHOCRMSDK::SharingRules::SharingRulesOperations.new(module_api_name)
			request =  ZOHOCRMSDK::SharingRules::FiltersBody.new
			criteria = ZOHOCRMSDK::SharingRules::Criteria.new
			criteria.group_operator="and"
			group=[]

			group_criteria1 = ZOHOCRMSDK::SharingRules::Criteria.new
			field1=ZOHOCRMSDK::SharingRules::Field.new
			field1.api_name="shared_from.type"
			group_criteria1.field = field1
			group_criteria1.value = "${EMPTY}"
			group_criteria1.comparator="equal"
			group.push(group_criteria1)
			
			
			group_criteria2 =  ZOHOCRMSDK::SharingRules::Criteria.new
			field2=ZOHOCRMSDK::SharingRules::Field.new
			field2.api_name="superiors_allowed"
			group_criteria2.field = field2
			group_criteria2.value="false"
			group_criteria2.comparator="equal"
			group.push(group_criteria2)
			
			group_criteria3 =  ZOHOCRMSDK::SharingRules::Criteria.new
			field3=ZOHOCRMSDK::SharingRules::Field.new
			field3.api_name="status"
			group_criteria3.field = field3
			group_criteria3.value="active"
			group_criteria3.comparator="equal"
			group.push(group_criteria3)
			
			
			group_criteria4 = ZOHOCRMSDK::SharingRules::Criteria.new
			group_criteria4.group_operator="or"
			
			group4=[]
			
			group4_criteria1 = ZOHOCRMSDK::SharingRules::Criteria.new
			group4_criteria1.group_operator="and"
			
			group41=[]
			
			group41_criteria1 = ZOHOCRMSDK::SharingRules::Criteria.new
			group41_criteria1field1=ZOHOCRMSDK::SharingRules::Field.new
			group41_criteria1field1.api_name="shared_to.resource.id"
			group41_criteria1.field = group41_criteria1field1
			group41_criteria1.value = List.of(11111777078, 11111777098)
			group41_criteria1.comparator="in"
			group41.push(group41_criteria1)
			
			group41_criteria2 =  ZOHOCRMSDK::SharingRules::Criteria.new
			group41_criteria1field2=ZOHOCRMSDK::SharingRules::Field.new
			group41_criteria1field2.api_name="shared_to.type"
			group41_criteria2.field = group41_criteria1field2
			group41_criteria2.value="groups"
			group41_criteria2.comparator="equal"
			group41.push(group41_criteria2)
			
			group4_criteria1.group = group41
			group4.push(group4_criteria1)
			
			
			group4_criteria2 =  ZOHOCRMSDK::SharingRules::Criteria.new
			group4_criteria2.group_operator="and"
			
			group42=[]
			
			group42_criteria1 =  ZOHOCRMSDK::SharingRules::Criteria.new
			group42_criteria1field1=ZOHOCRMSDK::SharingRules::Field.new
			group42_criteria1field1.api_name="shared_to.resource.id"
			group42_criteria1.field = group42_criteria1field1
			group42_criteria1.value = List.of(11111777078, 11111777098)
			group42_criteria1.comparator="in"
			group42.push(group42_criteria1)
			
			group42_criteria2 =  ZOHOCRMSDK::SharingRules::Criteria.new
			group42_criteria1field2=ZOHOCRMSDK::SharingRules::Field.new
			group42_criteria1field2.api_name="shared_to.type"
			group42_criteria2.field = group42_criteria1field2
			group42_criteria2.value="roles"
			group42_criteria2.comparator="equal"
			group42.push(group42_criteria2)
			
			group4_criteria2.group = group42
			group4.push(group4_criteria2)
			
			group_criteria4.group = group4
			group.push(group_criteria4)
			
			criteria.group = group
			
			request.filters = [criteria]
			response = sharing_rules_operations.search_sharing_rules_summary(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::SharingRules::SummaryResponseWrapper
						response_wrapper = response_handler
						rules_summary= response_wrapper.sharing_rules_summary
						rules_summary.each do |rule_summary|
							module_1 = rule_summary.module
							if module_1 != nil
								print "rules_summary Module APIName: " + module_1.api_name.to_s + "\n"
								print "rules_summary Module Id: " + module_1.id.to_s + "\n"
							end
							print "rules_summary RuleComputationStatus: " + rule_summary.rule_computation_status.to_s + "\n"
							print "rules_summary RuleCount: " + rule_summary.rule_count.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::SharingRules::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
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
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				module_api_name = "leads"
				search_sharing_rules_summary(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
SearchSharingRulesSummary.initialize_and_call