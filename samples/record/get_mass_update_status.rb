require "ZOHOCRMSDK8_0"

class GetMassUpdateStatus
	def self.get_mass_update_status
		begin
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetMassUpdateStatusParam.job_id, "347706116859123")
			
			response = record_operations.get_mass_update_status(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Record::MassUpdateResponseWrapper
						mass_update_wrapper = response_handler
						mass_update_response = mass_update_wrapper.data
						
						if mass_update_response != nil && mass_update_response.length > 0
							mass_update_response.each_with_index do |mass_update, index|
								if mass_update.is_a? ZOHOCRMSDK::Record::MassUpdate
									print "ℹ️ Status: " + mass_update.status + "\n"
									if mass_update.count != nil
										count = mass_update.count
										if count.updated_count != nil
											print "  Records UpdatedCount: " + count.updated_count.to_s + "\n"
										end
										if count.failed_count != nil
											print "  Records FailedCount: " + count.failed_count.to_s + "\n"
										end
										if count.total_count != nil
											print " Total TotalCount: " + count.total_count.to_s + "\n"
										end
										if count.not_updated_count != nil
											print " Total NotUpdatedCount: " + count.not_updated_count.to_s + "\n"
										end
									end
								elsif mass_update.is_a? ZOHOCRMSDK::Record::APIException
									exception = mass_update
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
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = response_handler
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
			get_mass_update_status
		rescue Exception => e
			raise e
		end
	end
end

GetMassUpdateStatus.initialize_and_call