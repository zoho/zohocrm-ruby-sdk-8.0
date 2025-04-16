require "ZOHOCRMSDK8_0"

class UpdateDataSharing
		def self.update_data_sharing
			data_sharing_operations =  ZOHOCRMSDK::DataSharing::DataSharingOperations.new
			request =  ZOHOCRMSDK::DataSharing::BodyWrapper.new
			data_sharing=[]
			data_sharing1 =  ZOHOCRMSDK::DataSharing::DataSharing.new
			data_sharing1.share_type =  ZOHOCRMSDK::Util::Choice.new("private")
			module_1 =  ZOHOCRMSDK::DataSharing::Module.new
			module_1.api_name="Leads"
			module_1.id = 34770612175
			data_sharing1.module = module_1
			data_sharing.push(data_sharing1)
			request.data_sharing = data_sharing
			response = data_sharing_operations.update_data_sharing(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::DataSharing::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.data_sharing
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::DataSharing::SuccessResponse
								success_response = action_response
								print "status: " + success_response.status.value.to_s + "\n"
								print "code: " + success_response.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								success_response.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + success_response.message.to_s + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::DataSharing::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::DataSharing::APIException
						exception = action_handler
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
				update_data_sharing
			rescue Exception => e
				raise e
			end
		end
end
UpdateDataSharing.initialize_and_call