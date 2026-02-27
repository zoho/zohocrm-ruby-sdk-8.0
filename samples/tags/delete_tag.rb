require "ZOHOCRMSDK8_0"

class DeleteTag
	def self.delete_tag
		begin
			# Set the tag ID to delete
			tag_id = 1055806000028883020  # Replace with actual tag ID
			
			# Initialize TagsOperations
			tags_operations = ZOHOCRMSDK::Tags::TagsOperations.new
			
			response = tags_operations.delete_tag(tag_id)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					if response.status_code == 204
						print "Success - Tag has been deleted successfully.\n"
						print "Tag ID " + tag_id.to_s + " has been removed from the system.\n"
					else
						print "Not Modified - No changes made to the tag.\n"
					end
					return
				end
				
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
			delete_tag
		rescue Exception => e
			raise e
		end
	end
end

DeleteTag.initialize_and_call