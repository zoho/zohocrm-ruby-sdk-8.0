require "ZOHOCRMSDK8_0"

class RemoveTerritoriesFromRecord
	def self.remove_territories_from_record
		begin
			# Initialize RecordOperations with module name
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			
			# Specify the record ID
			record_id = 1055806000029102002  # Replace with actual record ID
			
			# Create the request body
			request = ZOHOCRMSDK::Record::BodyWrapper.new
			
			records = []
			record = ZOHOCRMSDK::Record::Record.new

			territory = ZOHOCRMSDK::Record::Territory.new
			territory.id = 1055806000003051397  # Replace with actual territory ID
			record.add_key_value("Territories", [territory]) 
			
			records.push(record)
			request.data = records
			
			response = record_operations.remove_territories_from_record(record_id, request)
			
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
						action_response_list = action_wrapper.data
						
						action_response_list.each_with_index do |action_response, index|
							if action_response.is_a? ZOHOCRMSDK::Record::SuccessResponse
								success_response = action_response
								print "Territory Removal #{index + 1} Status: SUCCESS\n"
								print "  Status: " + success_response.status.value.to_s + "\n"
								print "  Code: " + success_response.code.value.to_s + "\n"
								
								if success_response.details != nil && success_response.details.size > 0
									print "  Details:\n"
									success_response.details.each do |keyName, keyValue|
										print "    " + keyName + ": " + keyValue.to_s + "\n"
									end
								end
								print "  Message: " + success_response.message.to_s + "\n"
								
							elsif action_response.is_a? ZOHOCRMSDK::Record::APIException
								api_exception = action_response
								print "Territory Removal #{index + 1} Status: ERROR\n"
								print "  Status: " + api_exception.status.value.to_s + "\n"
								print "  Code: " + api_exception.code.value.to_s + "\n"
								
								if api_exception.details != nil && api_exception.details.size > 0
									print "  Details:\n"
									api_exception.details.each do |keyName, keyValue|
										print "    " + keyName + ": " + keyValue.to_s + "\n"
									end
								end
								print "  Message: " + api_exception.message.value.to_s + "\n"
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = response_handler
						print "Remove Territories API Exception:\n"
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
			remove_territories_from_record
		rescue Exception => e
			raise e
		end
	end
end

RemoveTerritoriesFromRecord.initialize_and_call