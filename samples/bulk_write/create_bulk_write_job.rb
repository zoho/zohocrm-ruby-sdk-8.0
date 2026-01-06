require "ZOHOCRMSDK8_0"

class CreateBulkWriteJob
	def self.create_bulk_write_job
		bulk_write_operations = ZOHOCRMSDK::BulkWrite::BulkWriteOperations.new
		request = ZOHOCRMSDK::BulkWrite::RequestWrapper.new
		
		# Set operation type (INSERT, UPDATE, UPSERT)
		request.operation = ZOHOCRMSDK::Util::Choice.new("insert")
		
		# Set ignore_empty flag
		request.ignore_empty = true
		
		# Create callback configuration
		call_back = ZOHOCRMSDK::BulkWrite::CallBack.new
		call_back.url = "https://www.example.com/callback"  # Replace with your callback URL
		call_back.method = ZOHOCRMSDK::Util::Choice.new("post")
		request.callback = call_back
		
		# Create resource configuration
		resource = ZOHOCRMSDK::BulkWrite::Resource.new
		resource.type = ZOHOCRMSDK::Util::Choice.new("data")
		
		# Set module for the operation
		module_ins = ZOHOCRMSDK::Modules::MinifiedModule.new
		module_ins.api_name = "Leads"  # Replace with your target module
		resource.module = module_ins
		
		# Set file ID from upload_file response
		resource.file_id = "1055806000028881001"  # Replace with actual file ID from upload_file
		
		# Configure field mappings
		field_mappings = []
		
		# Example field mapping 1: First Name
		field_mapping_1 = ZOHOCRMSDK::BulkWrite::FieldMapping.new
		field_mapping_1.api_name = "First_Name"
		field_mapping_1.index = 0  # Column index in CSV file (0-based)
		field_mappings.push(field_mapping_1)
		
		# Example field mapping 2: Last Name  
		field_mapping_2 = ZOHOCRMSDK::BulkWrite::FieldMapping.new
		field_mapping_2.api_name = "Last_Name"
		field_mapping_2.index = 1
		field_mappings.push(field_mapping_2)
		
		# Example field mapping 3: Email
		field_mapping_3 = ZOHOCRMSDK::BulkWrite::FieldMapping.new
		field_mapping_3.api_name = "Email"
		field_mapping_3.index = 2
		field_mappings.push(field_mapping_3)
		
		# Example field mapping 4: Phone
		field_mapping_4 = ZOHOCRMSDK::BulkWrite::FieldMapping.new
		field_mapping_4.api_name = "Phone"
		field_mapping_4.index = 3
		field_mappings.push(field_mapping_4)
		
		# Example field mapping 5: Company
		field_mapping_5 = ZOHOCRMSDK::BulkWrite::FieldMapping.new
		field_mapping_5.api_name = "Company"
		field_mapping_5.index = 4
		field_mappings.push(field_mapping_5)
		
		resource.field_mappings = field_mappings
		
		# Set find_by field for UPSERT operations (optional)
		# resource.find_by = "Email"
		
		request.resource = [resource]
		
		response = bulk_write_operations.create_bulk_write_job(request)
		
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if response.status_code == 204
				print "No Content\n"
				return
			end
			
			if response.is_expected
				action_handler = response.data_object
				
				if action_handler.is_a? ZOHOCRMSDK::BulkWrite::SuccessResponse
					success_response = action_handler
					if success_response.status != nil
						print "  Status: " + success_response.status.value + "\n"
					end
					
					if success_response.code != nil
						print "  Code: " + success_response.code.value + "\n"
					end
					
					if success_response.message != nil
						print "  Message: " + success_response.message.value + "\n"
					end
					
					if success_response.details != nil && success_response.details.length > 0
						print "  Job Details:\n"
						success_response.details.each do |key, value|
							print "    " + key + ": " + value.to_s + "\n"
						end
					end
					
				elsif action_handler.is_a? ZOHOCRMSDK::BulkWrite::APIException
					exception = action_handler
					print "  Status: " + exception.status.value + "\n" if exception.status
					print "  Code: " + exception.code.value + "\n" if exception.code
					print "  Message: " + exception.message.value + "\n" if exception.message
					if exception.details != nil && exception.details.length > 0
						print "  Error Details:\n"
						exception.details.each do |key, value|
							print "    " + key + ": " + value.to_s + "\n"
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
			create_bulk_write_job
		rescue Exception => e
			raise e
		end
	end
end

CreateBulkWriteJob.initialize_and_call