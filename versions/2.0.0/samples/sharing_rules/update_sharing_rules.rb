require "ZOHOCRMSDK8_0"

class UpdateSharingRules
		def self.update_sharing_rules(module_api_name)
			sharing_rules_operations = ZOHOCRMSDK::SharingRules::SharingRulesOperations.new(module_api_name)
			request = ZOHOCRMSDK::SharingRules::BodyWrapper.new
			sharing_rules=[]
			sharing_rule = ZOHOCRMSDK::SharingRules::SharingRules.new
			
			sharing_rule.type =  ZOHOCRMSDK::Util::Choice.new("record__owner__based")
			shared_from = ZOHOCRMSDK::SharingRules::Shared.new
			resource =  ZOHOCRMSDK::SharingRules::Resource.new
			resource.id = 34777236002
			shared_from.resource = resource
			shared_from.type =  ZOHOCRMSDK::Util::Choice.new("groups")
			shared_from.subordinates = false
			sharing_rule.shared_from = shared_from
			
			# sharing_rule.type =  ZOHOCRMSDK::Util::Choice.new("criteria__based")
			# criteria = ZOHOCRMSDK::SharingRules::Criteria.new
			# criteria.comparator="equal"
			# field= ZOHOCRMSDK::SharingRules::Field.new
			# field.api_name="Wizard"
			# field.id = 111111095003
			# criteria.field = field
			# value =  JSONObject.new
			# value.store("name", "test_wizards")
			# value.store("id", "111111095001")
			# criteria.value = value
			# sharing_rule.criteria = criteria
			
			sharing_rule.superiors_allowed = false
			
			shared_to = ZOHOCRMSDK::SharingRules::Shared.new
			resource = ZOHOCRMSDK::SharingRules::Resource.new
			resource.id = 34777236002
			shared_to.resource = resource
			shared_to.type =  ZOHOCRMSDK::Util::Choice.new("groups")
			shared_to.subordinates = false
			sharing_rule.shared_to = shared_to
			
			sharing_rule.permission_type =  ZOHOCRMSDK::Util::Choice.new("read_write_delete")
			sharing_rule.id = 3477051001
			
			sharing_rules.push(sharing_rule)
			request.sharing_rules = sharing_rules
			response = sharing_rules_operations.update_sharing_rules(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::SharingRules::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.sharing_rules
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::SharingRules::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.value.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::SharingRules::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.value.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::SharingRules::APIException
						exception = action_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.to_s + "\n"
					end
				else
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
				update_sharing_rules(module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
UpdateSharingRules.initialize_and_call