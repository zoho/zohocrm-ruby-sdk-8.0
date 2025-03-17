require "ZOHOCRMSDK8_0"

class GetRelatedRecordsCount
		def self.get_related_records_count(record_id, module_api_name)
			get_related_records_count_operations = ZOHOCRMSDK::GetRelatedRecordsCount::GetRelatedRecordsCountOperations.new(record_id, module_api_name)
			request = ZOHOCRMSDK::GetRelatedRecordsCount::BodyWrapper.new
			get_related_records_count=[]
			get_related_records_count1 = ZOHOCRMSDK::GetRelatedRecordsCount::GetRelatedRecordCount.new
			related_list = ZOHOCRMSDK::GetRelatedRecordsCount::RelatedList.new
			related_list.api_name="Notes"
			related_list.id = 34770602197
			get_related_records_count1.related_list = related_list
			get_related_records_count.push(get_related_records_count1)
			request.related_records_count = get_related_records_count
			response = get_related_records_count_operations.get_related_records_count(request)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					action_handler = response.data_object
					if action_handler.is_a? ZOHOCRMSDK::GetRelatedRecordsCount::ActionWrapper
						action_wrapper = action_handler
						action_responses= action_wrapper.get_related_records_count
						action_responses.each do |action_response|
							if action_response.is_a? ZOHOCRMSDK::GetRelatedRecordsCount::SuccessResponse
								success_response = action_response
								print "count: " + success_response.count.to_s + "\n"
							related_list = success_response.related_list
								if related_list != nil
									print "related_list APIName: " + related_list.api_name.to_s + "\n"
									print "related_list Id: " + related_list.id.to_s + "\n"
								end
							elsif action_response.is_a? ZOHOCRMSDK::GetRelatedRecordsCount::APIException
								exception = action_response
								print "status: " + exception.status.value.to_s + "\n"
								print "code: " + exception.code.value.to_s + "\n"
								print "details: ".to_s + "\n"
								exception.details.each do |k, v|
									print k + ": " + v.to_s + "\n"
								end
								print "message: " + exception.message.to_s + "\n"
							end
						end
					elsif action_handler.is_a? ZOHOCRMSDK::GetRelatedRecordsCount::APIException
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
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", grant_token: "grant_token")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				record_id = 34770002
				module_api_name = "leads"
				get_related_records_count(record_id, module_api_name)
			rescue Exception => e
				raise e
			end
		end
end
GetRelatedRecordsCount.initialize_and_call