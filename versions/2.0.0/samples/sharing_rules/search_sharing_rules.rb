require "ZOHOCRMSDK8_0"

class SearchSharingRules
		def self.search_sharing_rules(module_api_name)
			sharing_rules_operations =  ZOHOCRMSDK::SharingRules::SharingRulesOperations.new(module_api_name)
			param_instance =  ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::SharingRules::SharingRulesOperations::GetSharingRulesParam.page, 1)
			param_instance.add(ZOHOCRMSDK::SharingRules::SharingRulesOperations::GetSharingRulesParam.per_page, 5)
			filters_body =  ZOHOCRMSDK::SharingRules::FiltersBody.new
			criteria =  ZOHOCRMSDK::SharingRules::Criteria.new
			criteria.group_operator="and"
			group=[]
			
			group_criteria1 =  ZOHOCRMSDK::SharingRules::Criteria.new
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
			
			
			group_criteria4 =  ZOHOCRMSDK::SharingRules::Criteria.new
			group_criteria4.group_operator="or"
			
			group4=[]
			
			group4_criteria1 =  ZOHOCRMSDK::SharingRules::Criteria.new
			group4_criteria1.group_operator="and"
			
			group41=[]
			
			group41_criteria1 =  ZOHOCRMSDK::SharingRules::Criteria.new
			group41_criteria1field1=ZOHOCRMSDK::SharingRules::Field.new
			group41_criteria1field1.api_name="shared_to.resource.id"
			group41_criteria1.field = group41_criteria1field1
			group41_criteria1.value = List.of(1111078, 111117098)
			group41_criteria1.comparator="in"
			group41.push(group41_criteria1)
			
			group41_criteria2 = ZOHOCRMSDK::SharingRules::Criteria.new
			group41_criteria1field2=ZOHOCRMSDK::SharingRules::Field.new
			group41_criteria1field2.api_name="shared_to.type"
			group41_criteria2.field = group41_criteria1field2
			group41_criteria2.value="groups"
			group41_criteria2.comparator="equal"
			group41.push(group41_criteria2)
			
			group4_criteria1.group = group41
			group4.push(group4_criteria1)
			
			
			group4_criteria2 = ZOHOCRMSDK::SharingRules::Criteria.new
			group4_criteria2.group_operator="and"
			
			group42=[]
			
			group42_criteria1 = ZOHOCRMSDK::SharingRules::Criteria.new
			group42_criteria1field1= ZOHOCRMSDK::SharingRules::Field.new
			group42_criteria1field1.api_name="shared_to.resource.id"
			group42_criteria1.field = group42_criteria1field1
			group42_criteria1.value = List.of(111117078, 111198)
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
			
			filters_body.filters = [criteria]
			response = sharing_rules_operations.search_sharing_rules(filters_body, param_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if [204, 304].include? response.status_code
					print response.status_code == 204 ? "no Content" : "not Modified".to_s + "\n"
					return
				end
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::SharingRules::ResponseWrapper
						response_wrapper = response_handler
						sharing_rules= response_wrapper.sharing_rules
						sharing_rules.each do |sharing_rule|
							module_1 = sharing_rule.module
							if module_1 != nil
								print "sharing_rules Module APIName: " + module_1.api_name.to_s + "\n"
								print "sharing_rules Module Name: " + module_1.name.to_s + "\n"
								print "sharing_rules Module Id: " + module_1.id.to_s + "\n"
							end
							print "sharing_rules SuperiorsAllowed: " + sharing_rule.superiors_allowed.to_s + "\n"
							print "sharing_rules Type: " + sharing_rule.type.value.to_s + "\n"
							shared_to = sharing_rule.shared_to
							if shared_to != nil
								resource = shared_to.resource
								if resource!= nil
									print "sharing_rules SharedTo Resource Name: " + resource.name.to_s + "\n"
									print "sharing_rules SharedTo Resource Id: " + resource.id.to_s + "\n"
								end
								print "sharing_rules SharedTo Type: " + shared_to.type.to_s + "\n"
								print "sharing_rules SharedTo Subordinates: " + shared_to.subordinates.to_s + "\n"
							end
							
							shared_from = sharing_rule.shared_from
							if shared_from!= nil
								resource = shared_from.resource
								if resource!= nil
									print "sharing_rules SharedFrom Resource Name: " + resource.name.to_s + "\n"
									print "sharing_rules SharedFrom Resource Id: " + resource.id.to_s + "\n"
								end
								print "sharing_rules SharedFrom Type: " + shared_from.type.to_s + "\n"
								print "sharing_rules SharedFrom Subordinates: " + shared_from.subordinates.to_s + "\n"
							end
							print "sharing_rules PermissionType: " + sharing_rule.permission_type.value.to_s + "\n"
							print "sharing_rules Name: " + sharing_rule.name.to_s + "\n"
							print "sharing_rules Id: " + sharing_rule.id.to_s + "\n"
							print "sharing_rules Status: " + sharing_rule.status.value.to_s + "\n"
							print "sharing_rules MatchLimitExceeded: " + sharing_rule.match_limit_exceeded.to_s + "\n"
						end
						info = response_wrapper.info
						print "sharing_rules Info PerPage: " + info.per_page.to_s + "\n"
						print "sharing_rules Info Count: " + info.count.to_s + "\n"
						print "sharing_rules Info Page: " + info.page.to_s + "\n"
						print "sharing_rules Info MoreRecords: " + info.more_records.to_s + "\n"
					elsif response_handler.is_a? ZOHOCRMSDK::SharingRules::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.value.to_s + "\n"
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
				search_sharing_rules(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
SearchSharingRules.initialize_and_call