require "ZOHOCRMSDK8_0"

class CreateRecords
	def self.create_records
		begin
			# Initialize RecordOperations with module name
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			
			# Create request body
			request = ZOHOCRMSDK::Record::BodyWrapper.new
			
			# Create a list of records to be created
			records_list = []
			
			# Create first record
			record1 = ZOHOCRMSDK::Record::Record.new
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Last_name, "Sample Lead 1")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.First_name, "John")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Company, "Sample Company 1")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Email, "john.lead1@example.com")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Phone, "1234567890")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Website, "https://www.example1.com")
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Lead_source, ZOHOCRMSDK::Util::Choice.new("Web Download"))
			record1.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Industry, ZOHOCRMSDK::Util::Choice.new("Large Enterprise"))
			records_list.push(record1)
			
			# Create second record
			record2 = ZOHOCRMSDK::Record::Record.new
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Last_name, "Sample Lead 2")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.First_name, "Jane")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Company, "Sample Company 2")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Email, "jane.lead2@example.com")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Phone, "0987654321")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Website, "https://www.example2.com")
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Lead_source, ZOHOCRMSDK::Util::Choice.new("Advertisement"))
			record2.add_field_value(ZOHOCRMSDK::Record::Field::Leads.Industry, ZOHOCRMSDK::Util::Choice.new("Service Provider"))
			records_list.push(record2)
			
			# Set the records to the request
			request.data = records_list
			
			# Add trigger workflow
			trigger = []
			trigger.push("approval")
			trigger.push("workflow")
			trigger.push("blueprint")
			request.trigger = trigger
			
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			
			response = record_operations.create_records(request, header_instance)
			
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
								print "=== Record #{index + 1} Creation Response ===\n"
								
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
									print "Record Creation Failed:\n"
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
								print "\n"
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = response_handler
						print "Records Create API Exception:\n"
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
			create_records
		rescue Exception => e
			raise e
		end
	end
end

CreateRecords.initialize_and_call