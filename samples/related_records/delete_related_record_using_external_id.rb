require "ZOHOCRMSDK8_0"

class DeleteRelatedRecordUsingExternalId
	def self.delete_related_record_using_external_id
		begin
			# Set the external IDs and related list API name
			external_id = "External" # Replace with actual parent record external ID
			external_field_value = "Products_External" # Replace with actual related record external ID
			module_api_name = "Leads"
			related_list_api_name = "Products"
			
			# Initialize RelatedRecordsOperations with required parameters
			related_records_operations = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
			
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			header_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::DeleteRelatedRecordUsingExternalIDHeader.X_external, "Leads.External,Products.Products_External")
			response = related_records_operations.delete_related_record_using_external_id(external_field_value, external_id, header_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
						action_wrapper = response_handler
						action_responses = action_wrapper.data
						
						if action_responses != nil && action_responses.length > 0
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
									success_response = action_response
									print "Status: " + success_response.status.value + "\n"
									print "Message: " + success_response.message.value + "\n"
									print "Code: " + success_response.code.value + "\n"
									
									if success_response.details != nil
										print "Details:\n"
										success_response.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									
								elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
									exception = action_response
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
						
					elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
						exception = response_handler
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Message: " + exception.message.value + "\n"
						
						if exception.details != nil
							print "Details:\n"
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
			delete_related_record_using_external_id
		rescue Exception => e
			raise e
		end
	end
end

DeleteRelatedRecordUsingExternalId.initialize_and_call