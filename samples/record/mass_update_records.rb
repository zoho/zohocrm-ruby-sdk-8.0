require "ZOHOCRMSDK8_0"

class MassUpdateRecords
	def self.mass_update_records
		begin
			# Initialize RecordOperations with module name
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			
			# Create mass update request body
			request = ZOHOCRMSDK::Record::MassUpdateBodyWrapper.new
			record = ZOHOCRMSDK::Record::Record.new
			record.add_key_value("Company", "Zoho")
			request.data = [record]
			
			# Alternative: Set specific record IDs for mass update (uncomment to use)
			record_ids = ["1055806000010777049", "1055806000010770034", "347706116859015"]
			request.ids = record_ids
			
			# Set additional options
			request.over_write = true # Overwrite existing values
			
			response = record_operations.mass_update_records(request)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Record::MassUpdateActionWrapper
						action_wrapper = response_handler
						action_responses = action_wrapper.data
						
						if action_responses != nil && action_responses.length > 0
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::Record::MassUpdateSuccessResponse
									success_response = action_response
									print "	  Status: " + success_response.status.value + "\n"
									print "   Message: " + success_response.message.value + "\n"
									print "   Code: " + success_response.code.value + "\n"
									if success_response.details != nil
										print "   Mass Update Details:\n"
										success_response.details.each do |key, value|
											print "     " + key + ": " + value.to_s + "\n"
										end
									end
								elsif action_response.is_a? ZOHOCRMSDK::Record::APIException
									exception = action_response
									print "   Status: " + exception.status.value + "\n"
									print "   Code: " + exception.code.value + "\n"
									print "   Message: " + exception.message.value + "\n"
									if exception.details != nil
										print "   Error Details:\n"
										exception.details.each do |key, value|
											print "     " + key + ": " + value.to_s + "\n"
										end
									end
								end
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = response_handler
						print "Mass Update API Exception:\n"
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
			mass_update_records
		rescue Exception => e
			raise e
		end
	end
end

MassUpdateRecords.initialize_and_call