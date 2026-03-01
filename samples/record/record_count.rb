require "ZOHOCRMSDK8_0"

class RecordCount
	def self.record_count
		begin
			# Initialize RecordOperations with module name
			record_operations = ZOHOCRMSDK::Record::RecordOperations.new("Leads")
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Add optional parameters for counting records
			# param_instance.add(ZOHOCRMSDK::Record::RecordOperations::RecordCountParam.criteria, "(Last_Name:equals:Smith)")
			# param_instance.add(ZOHOCRMSDK::Record::RecordOperations::RecordCountParam.cvid, "1055806000000091023")
			# param_instance.add(ZOHOCRMSDK::Record::RecordOperations::RecordCountParam.email, "test@example.com")
			# param_instance.add(ZOHOCRMSDK::Record::RecordOperations::RecordCountParam.phone, "1234567890")
			param_instance.add(ZOHOCRMSDK::Record::RecordOperations::RecordCountParam.word, "test")
			
			response = record_operations.record_count(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Record::CountWrapper
						count_wrapper = response_handler
						
						if count_wrapper.count != nil
							print "=== Record Count Result ===\n"
							print "Total Records: " + count_wrapper.count.to_s + "\n"
						else
							print "No count information available.\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Record::APIException
						exception = response_handler
						print "Record Count API Exception:\n"
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
			record_count
		rescue Exception => e
			raise e
		end
	end
end

RecordCount.initialize_and_call