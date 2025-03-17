require "ZOHOCRMSDK8_0"

class GetDataSharing
		def self.get_data_sharing
			data_sharing_operations = ZOHOCRMSDK::DataSharing::DataSharingOperations.new
			response = data_sharing_operations.get_data_sharing
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::DataSharing::ResponseWrapper
						response_wrapper = response_handler
						data_sharing= response_wrapper.data_sharing
						data_sharing.each do |data_sharing1|
							print "data_sharing PublicInPortals: " + data_sharing1.public_in_portals.to_s + "\n"
							print "data_sharing ShareType: " + data_sharing1.share_type.value.to_s + "\n"
							module_1 = data_sharing1.module
							if module_1 != nil
								print "data_sharing Module APIName: " + module_1.api_name.to_s + "\n"
								print "data_sharing Module Id: " + module_1.id.to_s + "\n"
							end
							print "data_sharing RuleComputationRunning: " + data_sharing1.rule_computation_running.to_s + "\n"
						end
					elsif response_handler.is_a? ZOHOCRMSDK::DataSharing::APIException
						exception = response_handler
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.to_s + "\n"
					end
				end
			end
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				get_data_sharing
			rescue Exception => e
				raise e
			end
	end
end
GetDataSharing.initialize_and_call