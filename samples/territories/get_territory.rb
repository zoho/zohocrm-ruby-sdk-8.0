require "ZOHOCRMSDK8_0"

class GetTerritory
	def self.get_territory
		begin
			# Set territory ID
			id = 1055806000003051357  # Replace with actual territory ID
			
			# Initialize TerritoriesOperations
			territories_operations = ZOHOCRMSDK::Territories::TerritoriesOperations.new
			
			response = territories_operations.get_territory(id)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - Territory not found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Territories::ResponseWrapper
						response_wrapper = response_handler
						territories = response_wrapper.territories
						if territories != nil && territories.length > 0
							territory = territories[0]
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
							
							if territory.created_time != nil
								print "Created Time: " + territory.created_time.to_s + "\n"
							end
							
							if territory.modified_time != nil
								print "Modified Time: " + territory.modified_time.to_s + "\n"
							end
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
			get_territory
		rescue Exception => e
			raise e
		end
	end
end

GetTerritory.initialize_and_call