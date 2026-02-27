require "ZOHOCRMSDK8_0"

class UploadFile
	def self.upload_file
		bulk_write_operations = ZOHOCRMSDK::BulkWrite::BulkWriteOperations.new
		file_body_wrapper = ZOHOCRMSDK::BulkWrite::FileBodyWrapper.new	
		file_path = "./Leads.zip"  # Replace with your CSV file path
	
		# Create stream wrapper
		stream_wrapper = ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, file_path)
		file_body_wrapper.file = stream_wrapper
		
		# Create header instance for upload
		header_instance = ZOHOCRMSDK::HeaderMap.new
		
		# Set feature header (optional - for specific bulk write features)
		header_instance.add(ZOHOCRMSDK::BulkWrite::BulkWriteOperations::UploadFileHeader.feature, "bulk-write")
		
		# Set organization header (optional)
		header_instance.add(ZOHOCRMSDK::BulkWrite::BulkWriteOperations::UploadFileHeader.X_crm_org, "org_id")
		
		response = bulk_write_operations.upload_file(file_body_wrapper, header_instance)
		
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				action_response = response.data_object
				
				if action_response.is_a? ZOHOCRMSDK::BulkWrite::SuccessResponse
					success_response = action_response
					if success_response.status != nil
						print "Status: " + success_response.status.value + "\n"
					end
					if success_response.code != nil
						print "Code: " + success_response.code.value + "\n"
					end
					if success_response.message != nil
						print "Message: " + success_response.message.value + "\n"
					end
					if success_response.details != nil && success_response.details.length > 0
						print "Upload Details:\n"
						success_response.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
				elsif action_response.is_a? ZOHOCRMSDK::BulkWrite::APIException
					exception = action_response
					if exception.status != nil
						print "Status: " + exception.status.value + "\n"
					end
					
					if exception.code != nil
						print "Code: " + exception.code.value + "\n"
					end
					
					if exception.message != nil
						print "Message: " + exception.message.value + "\n"
					end
					
					if exception.details != nil && exception.details.length > 0
						print "Error Details:\n"
						exception.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
				end
			else
				print "Unexpected HTTP Error Code: " + response.status_code.to_s + "\n"
				response_object = response.data_object
				if response_object != nil
					response_object.instance_variables.each do |field|
						print field.to_s + " = " + response_object.instance_variable_get(field).to_s + "\n"
					end
				end
			end
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			upload_file
		rescue Exception => e
			raise e
		end
	end
end

UploadFile.initialize_and_call