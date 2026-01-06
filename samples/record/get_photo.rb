require "ZOHOCRMSDK8_0"

class GetPhoto
	def self.get_photo
		destination_folder = "./"
		begin
			# Initialize RecordOperations with module name
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			
			# Set the record ID for which you want to get the photo
			record_id = 1055806000028884052
			
			response = record_operations.get_photo(record_id)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No photo available" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Record::FileBodyWrapper
						file_body_wrapper = response_handler
						stream_wrapper = file_body_wrapper.file
						File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
							f.write(stream_wrapper.stream)
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = response_handler
						print "API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Details: \n"
						if exception.details != nil
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
						print "Message: " + exception.message + "\n"
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
			get_photo
		rescue Exception => e
			raise e
		end
	end
end

GetPhoto.initialize_and_call