require "ZOHOCRMSDK8_0"

class GetDeletedRecords
	def self.get_deleted_records
		begin
			# Initialize RecordOperations with module name
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Add optional parameters
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetDeletedRecordsParam.type, "all") # Options: all, recycle, permanent
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetDeletedRecordsParam.page, 1)
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetDeletedRecordsParam.per_page, 200)
			
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			
			response = record_operations.get_deleted_records(param_instance, header_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No deleted records found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Record::DeletedRecordsWrapper
						deleted_records_wrapper = response_handler
						deleted_records = deleted_records_wrapper.data
						
						if deleted_records != nil && deleted_records.length > 0
							deleted_records.each_with_index do |deleted_record, index|
								if deleted_record.deleted_by != nil
									deleted_by = deleted_record.deleted_by
									print "  Deleted By:\n"
									if deleted_by.id != nil
										print "    ID: " + deleted_by.id.to_s + "\n"
									end
									if deleted_by.name != nil
										print "    Name: " + deleted_by.name + "\n"
									end
								end
								
								if deleted_record.id != nil
									print "  Record ID: " + deleted_record.id.to_s + "\n"
								end
								
								if deleted_record.display_name != nil
									print "  Display Name: " + deleted_record.display_name + "\n"
								end
								
								if deleted_record.type != nil
									print "  Deletion Type: " + deleted_record.type + "\n"
								end
								
								if deleted_record.created_by != nil
									created_by = deleted_record.created_by
									print "  Created By:\n"
									if created_by.id != nil
										print "    ID: " + created_by.id.to_s + "\n"
									end
									if created_by.name != nil
										print "    Name: " + created_by.name + "\n"
									end
								end
								
								if deleted_record.deleted_time != nil
									print "  Deleted Time: " + deleted_record.deleted_time.to_s + "\n"
								end
							end
							
							# Display pagination info if available
							if deleted_records_wrapper.info != nil
								info = deleted_records_wrapper.info
								print "=== Pagination Info ===\n"
								
								if info.count != nil
									print "  Total Deleted Records: " + info.count.to_s + "\n"
								end
								
								if info.page != nil
									print "  Current Page: " + info.page.to_s + "\n"
								end
								
								if info.per_page != nil
									print "  Per Page: " + info.per_page.to_s + "\n"
								end
								
								if info.more_records != nil
									print "  More Records Available: " + info.more_records.to_s + "\n"
								end
							end
							
						else
							print "No deleted records found.\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = response_handler
						print "Deleted Records API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Message: " + exception.message.value + "\n"
						
						if exception.details != nil
							print "Details:\n"
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
			get_deleted_records
		rescue Exception => e
			raise e
		end
	end
end

GetDeletedRecords.initialize_and_call