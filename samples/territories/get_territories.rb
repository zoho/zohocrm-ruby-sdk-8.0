require "ZOHOCRMSDK8_0"

class GetTerritories
	def self.get_territories
		begin
			# Initialize TerritoriesOperations
			territories_operations = ZOHOCRMSDK::Territories::TerritoriesOperations.new
			
			# Create ParameterMap for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			# param_instance.add(ZOHOCRMSDK::Territories::TerritoriesOperations::GetTerritoriesParam.page, 1)
			# param_instance.add(ZOHOCRMSDK::Territories::TerritoriesOperations::GetTerritoriesParam.per_page, 200)
			
			response = territories_operations.get_territories(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No territories found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Territories::ResponseWrapper
						response_wrapper = response_handler
						territories = response_wrapper.territories
						if territories != nil && territories.length > 0
							territories.each_with_index do |territory, index|
								if territory.id != nil
									print "Territory ID: " + territory.id.to_s + "\n"
								end
								
								if territory.name != nil
									print "Territory Name: " + territory.name + "\n"
								end
								
								if territory.description != nil
									print "Description: " + territory.description + "\n"
								end
								
								if territory.manager != nil
									print "Manager: " + territory.manager.name + " (" + territory.manager.id.to_s + ")\n"
								end
								
							end
						else
							print "No territories found\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Territories::APIException
						exception = response_handler
						print "Territories API Exception:\n"
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
			get_territories
		rescue Exception => e
			raise e
		end
	end
end

GetTerritories.initialize_and_call