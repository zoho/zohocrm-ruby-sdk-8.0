require "ZOHOCRMSDK8_0"

class DeletePhoto
	def self.delete_photo
		begin
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			record_id = 1055806000028884055
			response = record_operations.delete_photo(record_id)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					response_handler = response.data_object
					if response_handler.is_a? ZOHOCRMSDK::Record::SuccessResponse
						success_response = response_handler
						print "Status: " + success_response.status.value + "\n"
						print "Message: " + success_response.message.value + "\n"
						print "Code: " + success_response.code.value + "\n"
						if success_response.details != nil
							print "Details:\n"
							success_response.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = response_handler
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
			delete_photo
		rescue Exception => e
			raise e
		end
	end
end

DeletePhoto.initialize_and_call