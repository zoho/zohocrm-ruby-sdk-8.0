require "ZOHOCRMSDK8_0"

class GetSharingRuleSummary
		def self.get_sharing_rule_summary(module_api_name)
			sharing_rules_operations =  ZOHOCRMSDK::SharingRules::SharingRulesOperations.new(module_api_name)
			response = sharing_rules_operations.get_sharing_rule_summary
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
							if module_1!= nil
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
				get_sharing_rule_summary(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetSharingRuleSummary.initialize_and_call