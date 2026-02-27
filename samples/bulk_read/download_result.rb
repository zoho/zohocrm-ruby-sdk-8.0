require "ZOHOCRMSDK8_0"

class DownloadResult
	def self.download_result
		job_id = 1055806000028871001  # Replace with actual job ID from create_bulk_read_job response
		destination_folder = "./"
		bulk_read_operations = ZOHOCRMSDK::BulkRead::BulkReadOperations.new
		response = bulk_read_operations.download_result(job_id)
		
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			if response.is_expected
				response_handler = response.data_object
				if response_handler.is_a? ZOHOCRMSDK::BulkRead::FileBodyWrapper
					file_body_wrapper = response_handler
					stream_wrapper = file_body_wrapper.file
					File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
						f.write(stream_wrapper.stream)
					end
				elsif response_handler.is_a? ZOHOCRMSDK::BulkRead::APIException
					exception = response_handler
					print "API Exception:\n"
					print "Status: " + exception.status.value + "\n"
					print "Code: " + exception.code.value + "\n"
					print "Details:\n"
					if exception.details != nil
						exception.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
					print "Message: " + exception.message + "\n"
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
			
		else
			print "Error: No response received from server\n"
			print "Check your network connection and API configuration.\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			download_result
		rescue Exception => e
			raise e
		end
	end
end

DownloadResult.initialize_and_call