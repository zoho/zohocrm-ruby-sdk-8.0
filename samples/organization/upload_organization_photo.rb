require "ZOHOCRMSDK8_0"

class UploadOrganizationPhoto
	def self.upload_organization_photo
		begin
			org_operations = ZOHOCRMSDK::Org::OrgOperations.new
			
			# Create the request body for file upload
			request = ZOHOCRMSDK::Org::FileBodyWrapper.new
			
			# Specify the file path to upload
			file_path = "./download.png"  # Replace with your actual file path
			stream_wrapper = ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, file_path)
			request.file = stream_wrapper
			
			response = org_operations.upload_organization_photo(request)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Org::SuccessResponse
						success_response = response_handler
						print "  Status: " + success_response.status.value + "\n"
						print "  Code: " + success_response.code.value + "\n"
						print "  Message: " + success_response.message + "\n"
						
						# Display upload details
						if success_response.details != nil
							success_response.details.each do |key, value|
								print "    " + key + ": " + value.to_s + "\n"
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::Org::APIException
						exception = response_handler
						print "  Status: " + exception.status.value + "\n"
						print "  Code: " + exception.code.value + "\n"
						print "  Message: " + exception.message + "\n"
						
						if exception.details != nil
							print "  Error Details:\n"
							exception.details.each do |key, value|
								print "    " + key + ": " + value.to_s + "\n"
							end
						end
					end
				end
			end
			
		rescue ZOHOCRMSDK::SDKException => e
			print "SDKException:\n"
			print "Error Code: " + e.code.to_s + "\n"
			print "Error Message: " + e.message + "\n"
			print "Error Details: " + e.details.to_s + "\n"
			
		rescue Exception => e
			print "Exception:\n"
			print e.message + "\n"
			print e.backtrace.join("\n") + "\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			upload_organization_photo
		rescue Exception => e
			raise e
		end
	end
end

UploadOrganizationPhoto.initialize_and_call