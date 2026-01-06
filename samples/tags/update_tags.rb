require "ZOHOCRMSDK8_0"

class UpdateTags
	def self.update_tags
		begin
			# Initialize TagsOperations
			tags_operations = ZOHOCRMSDK::Tags::TagsOperations.new
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::Tags::BodyWrapper.new
			tags = []
			
			# Update first tag
			tag1 = ZOHOCRMSDK::Tags::Tag.new
			tag1.id = 1055806000028893014  # Replace with actual tag ID
			tag1.name = "Updated Important Leads"
			tag1.color_code = "#FF5733"  # Updated color
			tags.push(tag1)
			
			# Update second tag
			tag2 = ZOHOCRMSDK::Tags::Tag.new
			tag2.id = 1055806000000025032  # Replace with actual tag ID
			tag2.name = "Updated High Priority"
			tag2.color_code = "#33FF57"  # Updated color
			tags.push(tag2)
			
			body_wrapper.tags = tags
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::UpdateTagsParam.module_1, "Leads")
			
			response = tags_operations.update_tags(body_wrapper, param_instance)
			
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
			update_tags
		rescue Exception => e
			raise e
		end
	end
end

UpdateTags.initialize_and_call