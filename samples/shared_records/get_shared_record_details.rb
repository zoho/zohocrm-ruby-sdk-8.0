require "ZOHOCRMSDK8_0"

class GetSharedRecordDetails
	def self.get_shared_record_details
		begin
			# Set module and record details
			module_api_name = "Leads"  # Replace with actual module name
			record_id = 1055806000028898011  # Replace with actual record ID
			
			# Initialize ShareRecordsOperations
			share_records_operations = ZOHOCRMSDK::ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			# param_instance.add(ZOHOCRMSDK::ShareRecords::ShareRecordsOperations::GetSharedRecordDetailsParam.shared_to, "user_id")
			# param_instance.add(ZOHOCRMSDK::ShareRecords::ShareRecordsOperations::GetSharedRecordDetailsParam.view, "summary")
			
			response = share_records_operations.get_shared_record_details(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No shared record details found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::ShareRecords::ResponseWrapper
						response_wrapper = response_handler
						share_records = response_wrapper.share
						
						if share_records != nil && share_records.length > 0
							share_records.each_with_index do |share_record, index|
								if share_record.share_related_records != nil
									print "Share Related Records: " + share_record.share_related_records.to_s + "\n"
								end
								
								if share_record.shared_through != nil
									shared_through = share_record.shared_through
									if shared_through.is_a? ZOHOCRMSDK::ShareRecords::SharedThrough
										if shared_through.name != nil
											print "Shared Through Module: " + shared_through.name + "\n"
										end
										if shared_through.id != nil
											print "Shared Through ID: " + shared_through.id.to_s + "\n"
										end
									end
								end
								
								if share_record.shared_time != nil
									print "Shared Time: " + share_record.shared_time.to_s + "\n"
								end
								
								if share_record.permission != nil
									print "Permission: " + share_record.permission.to_s + "\n"
								end
								
								if share_record.shared_by != nil
									shared_by = share_record.shared_by
									print "Shared By: " + (shared_by.name || "N/A") + " (ID: " + (shared_by.id || "N/A").to_s + ")\n"
								end
								
								if share_record.user != nil
									user = share_record.user
									print "Shared To User: " + (user.name || "N/A") + " (ID: " + (user.id || "N/A").to_s + ")\n"
								end
							end
						else
							print "No shared record details found.\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::ShareRecords::APIException
						exception = response_handler
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
			get_shared_record_details
		rescue Exception => e
			raise e
		end
	end
end

GetSharedRecordDetails.initialize_and_call