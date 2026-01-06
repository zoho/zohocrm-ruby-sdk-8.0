require "ZOHOCRMSDK8_0"

class UpdateSharePermissions
	def self.update_share_permissions
		begin
			# Set module and record details
			module_api_name = "Leads"  # Replace with actual module name
			record_id = 1055806000028898011  # Replace with actual record ID
			
			# Initialize ShareRecordsOperations
			share_records_operations = ZOHOCRMSDK::ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
			
			# Create request body
			body_wrapper = ZOHOCRMSDK::ShareRecords::BodyWrapper.new
			share_records = []
			
			# Update first user's permissions
			share_record = ZOHOCRMSDK::ShareRecords::ShareRecord.new
			share_record.permission = "full_access"
			share_record.type = ZOHOCRMSDK::Util::Choice.new("public")
			
			# Set user whose permissions to update
			user1 = ZOHOCRMSDK::Users::Users.new
			user1.id = 1055806000017236002  # Replace with actual user ID
			share_record.user = user1

			share_records.push(share_record)
			
			body_wrapper.share = share_records
			
			response = share_records_operations.update_share_permissions(body_wrapper)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::ShareRecords::ActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.share
						
						if action_responses != nil && action_responses.length > 0
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::ShareRecords::SuccessResponse
									success_response = action_response
									print "Status: " + success_response.status.value + "\n"
									print "Code: " + success_response.code.value + "\n"
									print "Message: " + success_response.message.value + "\n"
									
									if success_response.details != nil
										print "Updated Details:\n"
										success_response.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									
								elsif action_response.is_a? ZOHOCRMSDK::ShareRecords::APIException
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
						
					elsif action_handler.is_a? ZOHOCRMSDK::ShareRecords::APIException
						exception = action_handler
						print "Share Records API Exception:\n"
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
				else
					response_object = response.data_object
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
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
			update_share_permissions
		rescue Exception => e
			raise e
		end
	end
end

UpdateSharePermissions.initialize_and_call