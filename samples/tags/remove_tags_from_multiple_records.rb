require "ZOHOCRMSDK8_0"

class RemoveTagsFromMultipleRecords
	def self.remove_tags_from_multiple_records
		begin
			# Set module details
			module_api_name = "Leads"  # Replace with actual module name
			
			# Initialize TagsOperations
			tags_operations = ZOHOCRMSDK::Tags::TagsOperations.new
			
			# Create request body
			record_action_wrapper = ZOHOCRMSDK::Tags::ExistingTagRequestWrapper.new
			
			tags = []
			
			tag1 = ZOHOCRMSDK::Tags::ExistingTag.new
			tag1.name = "Bulk Tag 1"
			tags.push(tag1)
			
			tag2 = ZOHOCRMSDK::Tags::ExistingTag.new
			tag2.name = "Bulk Tag 2"
			tags.push(tag2)

			record_action_wrapper.tags = tags
			record_action_wrapper.ids = [1055806000028898011, 1055806000028898010]
			
			response = tags_operations.remove_tags_from_multiple_records(module_api_name, record_action_wrapper)
			
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
			remove_tags_from_multiple_records
		rescue Exception => e
			raise e
		end
	end
end

RemoveTagsFromMultipleRecords.initialize_and_call