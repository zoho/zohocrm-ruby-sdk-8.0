require "ZOHOCRMSDK8_0"

class GetRelatedRecordsUsingExternalId
	def self.get_related_records_using_external_id
		begin
			# Set the external value and related list API name
			external_value = "External" # Replace with actual external ID value
			module_api_name = "Leads"
			related_list_api_name = "Products" # Related list API name
			
			# Initialize RelatedRecordsOperations with required parameters
			related_records_operations = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Add optional parameters
			param_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsUsingExternalIDParam.fields, "id")
			param_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsUsingExternalIDParam.page, 1)
			param_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsUsingExternalIDParam.per_page, 200)
			# param_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsUsingExternalIDParam.ids, "Products_External,1055806000012260001")
			
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			header_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsUsingExternalIDHeader.X_external, "Leads.External")
			# header_instance.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsUsingExternalIDHeader.If_modified_since, DateTime.new(2023, 1, 1, 10, 0, 0))
			
			response = related_records_operations.get_related_records_using_external_id(external_value, param_instance, header_instance)
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No related records found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::RelatedRecords::ResponseWrapper
						response_wrapper = response_handler
						records_list = response_wrapper.data
						
						if records_list != nil && records_list.length > 0
							records_list.each_with_index do |record, index|
								# Basic record information
								if record.id != nil
									print "  Record ID: " + record.id.to_s + "\n"
								end
								
								# Created by information
								if record.created_by != nil
									created_by = record.created_by
									print "  Created By:\n"
									if created_by.id != nil
										print "    ID: " + created_by.id.to_s + "\n"
									end
									if created_by.name != nil
										print "    Name: " + created_by.name + "\n"
									end
								end
								
								if record.created_time != nil
									print "  Created Time: " + record.created_time.to_s + "\n"
								end
								
								# Modified by information
								if record.modified_by != nil
									modified_by = record.modified_by
									print "  Modified By:\n"
									if modified_by.id != nil
										print "    ID: " + modified_by.id.to_s + "\n"
									end
									if modified_by.name != nil
										print "    Name: " + modified_by.name + "\n"
									end
								end
								
								if record.modified_time != nil
									print "  Modified Time: " + record.modified_time.to_s + "\n"
								end
								
								# Display all record fields
								print "  Record Fields:\n"
								record.get_key_values.each do |key, value|
									if value.is_a?(Array)
										print "    " + key + ":\n"
										value.each_with_index do |data, val_index|
											if data.is_a?(Hash)
												print "      [#{val_index}]:\n"
												data.each { |k, v| print "        #{k}: #{v}\n" }
											else
												print "      [#{val_index}]: #{data}\n"
											end
										end
									elsif value.is_a?(Hash)
										print "    " + key + ":\n"
										value.each { |k, v| print "      #{k}: #{v}\n" }
									else
										if value != nil
											print "    " + key + ": " + value.to_s + "\n"
										end
									end
								end
								
								print "\n"
							end
							
							# Display pagination info if available
							if response_wrapper.info != nil
								info = response_wrapper.info
								print "=== Pagination Info ===\n"
								
								if info.count != nil
									print "  Record Count: " + info.count.to_s + "\n"
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
							print "No records found.\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
						exception = response_handler
						print "Records API Exception:\n"
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
			get_related_records_using_external_id
		rescue Exception => e
			raise e
		end
	end
end

GetRelatedRecordsUsingExternalId.initialize_and_call