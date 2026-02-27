require "ZOHOCRMSDK8_0"

class UploadFiles
	def self.upload_files
		file_path = "./download.png"
		
		begin
			files_operations = ZOHOCRMSDK::Files::FilesOperations.new
			request = ZOHOCRMSDK::Files::BodyWrapper.new
			
			# Create file object
			sw = ZOHOCRMSDK::Util::StreamWrapper.new(nil, nil, file_path)
			
			request.file = [sw]
			
			# Add parameters if needed
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Files::FilesOperations::UploadFilesParam.type, "inline")
			
			response = files_operations.upload_files(request, param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if response.status_code == 204
					print "No Content\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Files::ActionWrapper
						action_wrapper = response_handler
						action_responses = action_wrapper.data
						
						if action_responses != nil
							action_responses.each_with_index do |action_response, index|
								if action_response.is_a? ZOHOCRMSDK::Files::SuccessResponse
									success_response = action_response
									print "Status: " + success_response.status.value + "\n"
									print "Code: " + success_response.code.value + "\n"
									print "Details: \n"
									if success_response.details != nil
										success_response.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									print "Message: " + success_response.message + "\n"
									print "---\n"
									
								elsif action_response.is_a? ZOHOCRMSDK::Files::APIException
									exception = action_response
									print "Status: " + exception.status.value + "\n"
									print "Code: " + exception.code.value + "\n"
									print "Details: \n"
									if exception.details != nil
										exception.details.each do |key, value|
											print "  " + key + ": " + value.to_s + "\n"
										end
									end
									print "Message: " + exception.message + "\n"
									print "---\n"
								end
							end
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Files::APIException
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
					
				elsif response.status_code != 204
					response_object = response.data_object
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
					end
				end
			end
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
			upload_files
		rescue Exception => e
			raise e
		end
	end
end

UploadFiles.initialize_and_call