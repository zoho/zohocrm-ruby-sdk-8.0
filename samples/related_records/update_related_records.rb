require "ZOHOCRMSDK8_0"

class UpdateRelatedRecords
	def self.update_related_records
		begin
			# Set the record ID and related list API name
			record_id = 1055806000028898011 # Replace with actual record ID
			module_api_name = "Leads"
			related_list_api_name = "Products" # Related list API name
			
			# Initialize RelatedRecordsOperations with required parameters
			related_records_operations = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
			
			# Create the request body
			body_wrapper = ZOHOCRMSDK::RelatedRecords::BodyWrapper.new
			records = []
			
			# Create first related record to update
			record1 = ZOHOCRMSDK::Record::Record.new
			record1.id = 1055806000006611017 # ID of the related record to update
			record1.add_key_value("list_price", 199.99)
			
			# Add custom fields
			record1.add_key_value("Custom_Field", "Updated Custom Value")
			
			records.push(record1)
			
			# Create second related record to update (optional)
			record2 = ZOHOCRMSDK::Record::Record.new
			record2.id = 1055806000010770034 # Another related record ID
			record2.add_key_value("list_price", 199.99)
			
			records.push(record2)
			
			body_wrapper.data = records
			
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			response = related_records_operations.update_related_records(record_id, body_wrapper, header_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
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
			update_related_records
		rescue Exception => e
			raise e
		end
	end
end

UpdateRelatedRecords.initialize_and_call