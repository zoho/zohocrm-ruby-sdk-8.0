require "ZOHOCRMSDK8_0"

class GetRecordCountForTag
	def self.get_record_count_for_tag
		begin
			# Set tag ID
			id = 1055806000010550007  # Replace with actual tag ID
			tags_operations = ZOHOCRMSDK::Tags::TagsOperations.new
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::GetRecordCountForTagParam.module_1, "Leads")
			response = tags_operations.get_record_count_for_tag(id, param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					count_handler = response.data_object
					
					if count_handler.is_a? ZOHOCRMSDK::Tags::CountResponseWrapper
						count_wrapper = count_handler
						count_details = count_wrapper.count
						print "Record Count for Tag ID " + id.to_s + ": " + count_details.to_s + "\n"
						
					elsif count_handler.is_a? ZOHOCRMSDK::Tags::APIException
						exception = count_handler
						print "Tags API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Message: " + exception.message.value + "\n"
						
						if exception.details != nil
							print "Error Details:\n"
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
					end
				end
			end
			
		rescue ZOHOCRMSDK::SDKException => e
			print "SDKException:\n"
			print "Error Code: " + e.code.to_s + "\n"
			print "Error Message: " + e.message + "\n"
			
		rescue Exception => e
			print "Exception:\n"
			print e.message + "\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_record_count_for_tag
		rescue Exception => e
			raise e
		end
	end
end

GetRecordCountForTag.initialize_and_call