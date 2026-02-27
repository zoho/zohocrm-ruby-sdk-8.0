require "ZOHOCRMSDK8_0"

class UpdateRecordUsingExternalId
	def self.update_record_using_external_id
		begin
			# Initialize RecordOperations with module name
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			
			# Specify the external field value to identify the record
			external_field_value = "External1"
			
			# Create request body
			request = ZOHOCRMSDK::Record::BodyWrapper.new
			
			# Create a list with single record to be updated
			records_list = []
			
			# Create record with updated data
			record = ZOHOCRMSDK::Record::Record.new
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Last_name, "Updated via External ID")
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.First_name, "External Update")
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Company, "External Update Company")
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Email, "external.updated@example.com")
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Phone, "9999999999")
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Website, "https://www.externalupdate.com")
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Lead_source, ZOHOCRMSDK::Util::Choice.new("Advertisement"))
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Industry, ZOHOCRMSDK::Util::Choice.new("Large Enterprise"))
			record.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Description, "Record updated using external ID lookup")
			
			records_list.push(record)
			
			# Set the records to the request
			request.data = records_list
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			
			# Specify which external field to use for lookup
			header_instance.add(ZOHOCRMSDK::Record::RecordOperations::UpdateRecordUsingExternalIDHeader.X_external, "Leads.External")
			
			response = record_operations.update_record_using_external_id(external_field_value, request, header_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Record::ActionWrapper
						action_wrapper = response_handler
						action_responses = action_wrapper.data
						
						if action_responses != nil && action_responses.length > 0
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::Record::SuccessResponse
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
									
								elsif action_response.is_a? ZOHOCRMSDK::Record::APIException
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
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
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
			update_record_using_external_id
		rescue Exception => e
			raise e
		end
	end
end

UpdateRecordUsingExternalId.initialize_and_call