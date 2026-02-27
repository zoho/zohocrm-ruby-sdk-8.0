require "ZOHOCRMSDK8_0"

class GetBulkReadJobDetails
	def self.get_bulk_read_job_details
		job_id = 1055806000028871001  # Replace with actual job ID from create_bulk_read_job response
		
		bulk_read_operations = ZOHOCRMSDK::BulkRead::BulkReadOperations.new
		
		response = bulk_read_operations.get_bulk_read_job_details(job_id)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::BulkRead::ResponseWrapper
					response_wrapper = response_handler
					job_details_list = response_wrapper.data
					
					if job_details_list != nil && job_details_list.length > 0
						job_details_list.each_with_index do |job_detail, index|
							if job_detail.is_a? ZOHOCRMSDK::BulkRead::JobDetail
								if job_detail.id != nil
									print "  Job ID: " + job_detail.id.to_s + "\n"
								end
								
								if job_detail.operation != nil
									print "  Operation: " + job_detail.operation + "\n"
								end
								
								if job_detail.state != nil
									print "  State: " + job_detail.state.value + "\n"
								end

								# Result information
								if job_detail.result != nil
									result = job_detail.result
									print "  Result Information:\n"
									
									if result.page != nil
										print "    Page: " + result.page.to_s + "\n"
									end
									
									if result.count != nil
										print "    Count: " + result.count.to_s + "\n"
									end
									
									if result.download_url != nil
										print "    Download URL: " + result.download_url + "\n"
									end
									
									if result.per_page != nil
										print "    Per Page: " + result.per_page.to_s + "\n"
									end
									
									if result.more_records != nil
										print "    More Records: " + result.more_records.to_s + "\n"
									end
								end
								
								# Query information
								if job_detail.query != nil
									query = job_detail.query
									print "  Query Details:\n"
									
									if query.module != nil
										print "    Module API Name: " + query.module.api_name + "\n"
										print "    Module Id: " + query.module.id.to_s + "\n"
									end
									if query.page != nil
										print "    Page: " + query.page.to_s + "\n"
									end
									if query.cvid != nil
										print "    Custom View ID: " + query.cvid.to_s + "\n"
									end
									
									if query.fields != nil && query.fields.length > 0
										print "    Fields: " + query.fields.join(", ") + "\n"
									end
									
									if query.criteria != nil
										criteria = query.criteria
										print "    Criteria:\n"
										if criteria.api_name != nil
											print "      Field: " + criteria.field.api_name + "\n"
										end
										if criteria.comparator != nil
											print "      Operator: " + criteria.comparator.value + "\n"
										end
										if criteria.value != nil
											print "      Value: " + criteria.value.to_s + "\n"
										end
									end
								end
								
								# Timestamps and user information
								if job_detail.created_time != nil
									print "  Created Time: " + job_detail.created_time.to_s + "\n"
								end
								if job_detail.file_type != nil
									print "  File Type: " + job_detail.file_type + "\n"
								end
								if job_detail.created_by != nil
									created_by = job_detail.created_by
									print "  Created By:\n"
									if created_by.id != nil
										print "    ID: " + created_by.id.to_s + "\n"
									end
									if created_by.name != nil
										print "    Name: " + created_by.name + "\n"
									end
								end
							end
						end
					end
				elsif response_handler.is_a? ZOHOCRMSDK::BulkRead::APIException
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
					print "Message: " + exception.message.value + "\n"
				end
			else
				print "HTTP Error Code: " + response.status_code.to_s + "\n"
				response_object = response.data_object
				if response_object != nil
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
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
			get_bulk_read_job_details
		rescue Exception => e
			raise e
		end
	end
end

GetBulkReadJobDetails.initialize_and_call