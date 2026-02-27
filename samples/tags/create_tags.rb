require "ZOHOCRMSDK8_0"

class CreateTags
	def self.create_tags
		begin
			# Initialize TagsOperations
			tags_operations = ZOHOCRMSDK::Tags::TagsOperations.new
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::Tags::BodyWrapper.new
			tags = []
			
			# Create first tag
			tag1 = ZOHOCRMSDK::Tags::Tag.new
			tag1.name = "Important Leads_1"
			tag1.color_code = "#FF0000"  # Red color
			tags.push(tag1)
			
			# Create second tag
			tag2 = ZOHOCRMSDK::Tags::Tag.new
			tag2.name = "High Priority"
			tag2.color_code = "#00FF00"  # Green color
			tags.push(tag2)
			
			# Create third tag
			tag3 = ZOHOCRMSDK::Tags::Tag.new
			tag3.name = "Follow Up Required"
			tag3.color_code = "#0000FF"  # Blue color
			tags.push(tag3)
			
			body_wrapper.tags = tags
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::CreateTagsParam.module_1, "Leads")
			
			response = tags_operations.create_tags(body_wrapper, param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::Tags::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.tags
						
						if action_responses != nil && action_responses.length > 0
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
									success_response = action_response
									print "Status: " + success_response.status.value + "\n"
									print "Code: " + success_response.code.value + "\n"
									print "Message: " + success_response.message.value + "\n"
									
									if success_response.details != nil
										print "Tag Details:\n"
										success_response.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									
								elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
									api_exception = action_response
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
						
					elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
						exception = action_handler
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
			create_tags
		rescue Exception => e
			raise e
		end
	end
end

CreateTags.initialize_and_call