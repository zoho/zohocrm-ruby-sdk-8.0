require "ZOHOCRMSDK8_0"

class GetBulkWriteJobDetails
	def self.get_bulk_write_job_details
		job_id = "1055806000028883001"  # Replace with actual job ID from create_bulk_write_job response
		
		bulk_write_operations = ZOHOCRMSDK::BulkWrite::BulkWriteOperations.new
		
		response = bulk_write_operations.get_bulk_write_job_details(job_id)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::BulkWrite::BulkWriteResponse
					response_wrapper = response_handler
					print "\n Bulk write Job Status: "
          print response_wrapper.status
					print "\n Bulk write CharacterEncoding: "
          print response_wrapper.character_encoding
          resources = response_wrapper.resource
					resources&.each do |resource|
						print "\n Bulk write Resource Status: "
            print resource.status.value
						print "\n Bulk write Resource Type: "
            print resource.type.value
						print "\n Bulk write Resource Module: "
            print resource.module
            field_mappings = resource.field_mappings
						field_mappings&.each do |field_mapping|
							print "\n Bulk write Resource FieldMapping Module: "
              print field_mapping.api_name
              unless field_mapping.index.nil?
								print "\n Bulk write Resource FieldMapping Index: "
                print field_mapping.index
              end
							unless field_mapping.format.nil?
                print "\n Bulk write Resource FieldMapping Format: "
                print field_mapping.format
              end
              unless field_mapping.find_by.nil?
                print "\n Bulk write Resource FieldMapping FindBy: "
                print field_mapping.find_by
              end
              field_mapping.default_value&.each do |k, v|
                print "\n "
                print k
                print v
                print "\n"
              end
						end
            file = resource.file
            unless file.nil?
              print "\n Bulk write Resource File Status: "
              print file.status.value
              print "\n Bulk write Resource File Name: "
              print file.name
              print "\n Bulk write Resource AddedCount: "
              print file.added_count
              print "\n Bulk write Resource SkippedCount: "
              print file.skipped_count
              print "\n Bulk write Resource UpdatedCount: "
              print file.updated_count
              print "\n Bulk write Resource TotalCount: "
              print file.total_count
            end
					end
					print "\n Bulk write ID: "
          print response_wrapper.id.to_s
					callback = response_wrapper.callback
          if callback.nil?
            print "\n Bulk write CallBack Url: "
            print callback.url
            print "\n Bulk write CallBack Method:  "
            print callback.method.value
          end
          result = response_wrapper.result
          unless result.nil?
            print "\n Bulk write DownloadUrl: "
            print result.download_url
          end
          created_by = response_wrapper.created_by
          unless created_by.nil?
            print "\n Bulk write Created By User-ID: "
            print created_by.id.to_s
            print "\n Bulk write Created By user-Name:"
            print created_by.name
          end
          print "\n Bulk write Operation: "
          print response_wrapper.operation
          print "\n Bulk write File CreatedTime: "
          print response_wrapper.created_time
				elsif response_handler.is_a? ZOHOCRMSDK::BulkWrite::APIException
					exception = response_handler
					print "API Exception:\n"
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
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
			end
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_bulk_write_job_details
		rescue Exception => e
			raise e
		end
	end
end

GetBulkWriteJobDetails.initialize_and_call