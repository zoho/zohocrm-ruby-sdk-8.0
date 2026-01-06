require "ZOHOCRMSDK8_0"

class AddTags
	def self.add_tags
		begin
			# Set module and record details
			module_api_name = "Leads"  # Replace with actual module name
			record_id = 1055806000028898011  # Replace with actual record ID
			
			# Initialize TagsOperations
			tags_operations = ZOHOCRMSDK::Tags::TagsOperations.new
			new_tag_request_wrapper = ZOHOCRMSDK::Tags::NewTagRequestWrapper.new
			tags = []
			tag = ZOHOCRMSDK::Tags::Tag.new
			tag.name = "New Record Tag"
			tag.color_code = "#FF6B35"
			tags.push(tag)
			
			new_tag_request_wrapper.tags = tags
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::AddTagsParam.over_write, "false")
			
			response = tags_operations.add_tags(module_api_name, record_id, new_tag_request_wrapper, param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					record_action_handler = response.data_object
					
					if record_action_handler.is_a? ZOHOCRMSDK::Tags::RecordActionWrapper
						record_action_wrapper_response = record_action_handler
						record_action_responses = record_action_wrapper_response.data
						
						if record_action_responses != nil && record_action_responses.length > 0
							record_action_responses.each_with_index do |record_action_response, index|
								if record_action_response.is_a? ZOHOCRMSDK::Tags::RecordSuccessResponse
									success_response = record_action_response
									print "Status: " + success_response.status.value + "\n"
									print "Code: " + success_response.code.value + "\n"
									print "Message: " + success_response.message + "\n"
									if success_response.details != nil
										success_response.details.each do |key, value|
											print "  " + key + ": "
											print value 
											print "\n"
										end
									end
									
								elsif record_action_response.is_a? ZOHOCRMSDK::Tags::APIException
									api_exception = record_action_response
									print "Status: " + api_exception.status.value + "\n"
									print "Code: " + api_exception.code.value + "\n"
									print "Message: " + api_exception.message.value + "\n"
									
									if api_exception.details != nil
										print "Error Details:\n"
										api_exception.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
								end
							end
						end
						
					elsif record_action_handler.is_a? ZOHOCRMSDK::Tags::APIException
						exception = record_action_handler
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
			add_tags
		rescue Exception => e
			raise e
		end
	end
end

AddTags.initialize_and_call