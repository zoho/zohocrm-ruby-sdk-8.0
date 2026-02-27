require "ZOHOCRMSDK8_0"

class DownloadBulkWriteResult
	def self.download_bulk_write_result
		destination_folder = "./"
		# Download URL from get_bulk_write_job_details response
		download_url = "https://download-accl.zoho.in/v2/crm/620/bulk-write/1055028883001/1055828883001.zip"
		bulk_write_operations = ZOHOCRMSDK::BulkWrite::BulkWriteOperations.new
		response = bulk_write_operations.download_bulk_write_result(download_url)
		
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::BulkWrite::FileBodyWrapper
					file_body_wrapper = response_handler
					stream_wrapper = file_body_wrapper.file
					File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
						f.write(stream_wrapper.stream)
					end
					
				elsif response_handler.is_a? ZOHOCRMSDK::BulkWrite::APIException
					exception = response_handler
					print "API Exception:\n"
					print "=" * 50 + "\n"
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
						print "Details:\n"
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
			download_bulk_write_result
		rescue Exception => e
			raise e
		end
	end
end

DownloadBulkWriteResult.initialize_and_call