require "ZOHOCRMSDK8_0"

class GetSharingRule
		def self.get_sharing_rule(module_api_name, id)
			sharing_rules_operations =  ZOHOCRMSDK::SharingRules::SharingRulesOperations.new(module_api_name)
			response = sharing_rules_operations.get_sharing_rule(id)
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
								if resource != nil
									print "sharing_rules SharedTo Resource Name: " + resource.name.to_s + "\n"
									print "sharing_rules SharedTo Resource Id: " + resource.id.to_s + "\n"
								end
								print "sharing_rules SharedTo Type: " + shared_to.type.to_s + "\n"
								print "sharing_rules SharedTo Subordinates: " + shared_to.subordinates.to_s + "\n"
							end
							
							shared_from = sharing_rule.shared_from
							if shared_from != nil
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
				id = 347706151001
				get_sharing_rule(module_api_name, id)
			rescue Exception => e
				raise e
			end
		end
end
GetSharingRule.initialize_and_call