require "ZOHOCRMSDK8_0"

class UploadPhoto
	def self.upload_photo
		begin
			# Initialize RecordOperations with module name
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			
			# Set the record ID for which you want to upload a photo
			record_id = 1055806000019033016
			
			# Create request body
			request = ZOHOCRMSDK::Record::FileBodyWrapper.new
			
			# Specify the photo file path (update this path to your actual photo)
			photo_file_path = "./photo.png"
			
			# Create stream wrapper for the photo
			stream_wrapper = ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, photo_file_path)
			request.file = stream_wrapper
			
			# Create parameter instance for additional options
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			response = record_operations.upload_photo(record_id, request, param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
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
			upload_photo
		rescue Exception => e
			raise e
		end
	end
end

UploadPhoto.initialize_and_call