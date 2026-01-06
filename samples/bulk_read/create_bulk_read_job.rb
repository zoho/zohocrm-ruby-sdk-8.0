require "ZOHOCRMSDK8_0"

class CreateBulkReadJob
	def self.create_bulk_read_job
		bulk_read_operations = ZOHOCRMSDK::BulkRead::BulkReadOperations.new
		request = ZOHOCRMSDK::BulkRead::BodyWrapper.new
		
		query = ZOHOCRMSDK::BulkRead::Query.new
		module_ins = ZOHOCRMSDK::Modules::MinifiedModule.new
		module_ins.api_name = "Leads"
		query.module = module_ins
		# query.cvid = 1055806000028846001
		
		# Optional fields selection
		# query.fields = ["First_Name", "Last_Name", "Email", "Phone"]
		
		# Optional criteria
		criteria = ZOHOCRMSDK::BulkRead::Criteria.new
		field = ZOHOCRMSDK::Fields::MinifiedField.new
		field.api_name = "Lead_Status"
		criteria.field = field
		criteria.comparator =  ZOHOCRMSDK::Util::Choice.new("equal")
		criteria.value = "Not Contacted"
		query.criteria = criteria
		
		request.query = query
		
		response = bulk_read_operations.create_bulk_read_job(request)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if response.status_code == 204
				print "No Content\n"
				return
			end
			
			if response.is_expected
				action_handler = response.data_object
				
				if action_handler.is_a? ZOHOCRMSDK::BulkRead::ActionWrapper
					action_wrapper = action_handler
					action_responses = action_wrapper.data
					if action_responses != nil && action_responses.length > 0
						action_responses.each_with_index do |action_response, index|
							if action_response.is_a? ZOHOCRMSDK::BulkRead::SuccessResponse
								success_response = action_response
								print "  Status: " + success_response.status.value + "\n"
								print "  Code: " + success_response.code.value + "\n"
								print "  Details: \n"
								if success_response.details != nil
									success_response.details.each do |key, value|
										print "    " + key + ": " + value.to_s + "\n"
									end
								end
								print "  Message: " + success_response.message.value + "\n"
							elsif action_response.is_a? ZOHOCRMSDK::BulkRead::APIException
								exception = action_response
								print "Job #{index + 1} - Creation Error:\n"
								print "  Status: " + exception.status.value + "\n"
								print "  Code: " + exception.code.value + "\n"
								print "  Details: \n"
								if exception.details != nil
									exception.details.each do |key, value|
										print "    " + key + ": " + value.to_s + "\n"
									end
								end
								print "  Message: " + exception.message + "\n"
							end
						end
					end
				elsif action_handler.is_a? ZOHOCRMSDK::BulkRead::APIException
					exception = action_handler
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
			create_bulk_read_job
		rescue Exception => e
			raise e
		end
	end
end

CreateBulkReadJob.initialize_and_call