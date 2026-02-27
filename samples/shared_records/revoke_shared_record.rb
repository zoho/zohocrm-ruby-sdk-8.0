require "ZOHOCRMSDK8_0"

class RevokeSharedRecord
	def self.revoke_shared_record
		begin
			# Set module and record details
			module_api_name = "Leads"  # Replace with actual module name
			record_id = 1055806000028898011  # Replace with actual record ID
			
			# Initialize ShareRecordsOperations
			share_records_operations = ZOHOCRMSDK::ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
			
			response = share_records_operations.revoke_shared_record
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					if response.status_code == 204
						print "Success - Shared record has been revoked successfully.\n"
						print "All sharing permissions for this record have been removed.\n"
					else
						print "Not Modified - No changes made to sharing permissions.\n"
					end
					return
				end
				
				if response.is_expected
					action_handler = response.data_object
					
					if action_handler.is_a? ZOHOCRMSDK::ShareRecords::DeleteActionWrapper
						action_wrapper = action_handler
						action_responses = action_wrapper.share
						
						if action_response.is_a? ZOHOCRMSDK::ShareRecords::SuccessResponse
							success_response = action_response
							print "Status: " + success_response.status.value + "\n"
							print "Code: " + success_response.code.value + "\n"
							print "Message: " + success_response.message.value + "\n"
							
							if success_response.details != nil
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
			revoke_shared_record
		rescue Exception => e
			raise e
		end
	end
end

RevokeSharedRecord.initialize_and_call