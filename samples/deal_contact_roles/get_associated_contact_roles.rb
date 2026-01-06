require "ZOHOCRMSDK8_0"

class GetAssociatedContactRoles
	def self.get_associated_contact_roles
		deal_contact_roles_operations = ZOHOCRMSDK::DealContactRoles::DealContactRolesOperations.new
		
		deal_id = 1055806000028564012  # Replace with actual deal ID
		param_instance = ZOHOCRMSDK::ParameterMap.new
		
		# Optional: Add specific contact IDs to filter
		param_instance.add(ZOHOCRMSDK::DealContactRoles::DealContactRolesOperations::GetAssociatedContactRolesParam.ids, "1055806000028594016,1055806000000691003")
		
		# Optional: Add specific fields to retrieve
		# param_instance.add(ZOHOCRMSDK::DealContactRoles::DealContactRolesOperations::GetAssociatedContactRolesParam.fields, "Contact_Role,Email,Full_Name")
		
		response = deal_contact_roles_operations.get_associated_contact_roles(deal_id, param_instance)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if response.status_code == 204
				print "No Content - No contact roles associated with this deal\n"
				return
			end
			if response.is_expected
				response_handler = response.data_object
				if response_handler.is_a?(ZOHOCRMSDK::DealContactRoles::ResponseWrapper)
					response_wrapper = response_handler
					records = response_wrapper.data
					records.each do |record|
						puts "Record ID: #{record.id}"
						created_by = record.created_by
						unless created_by.nil?
							puts "Record Created By User-ID: #{created_by.id}"
							puts "Record Created By User-Name: #{created_by.name}"
							puts "Record Created By User-Email: #{created_by.email}"
						end
						puts "Record CreatedTime: #{record.created_time}"

						modified_by = record.modified_by
						unless modified_by.nil?
							puts "Record Modified By User-ID: #{modified_by.id}"
							puts "Record Modified By User-Name: #{modified_by.name}"
							puts "Record Modified By User-Email: #{modified_by.email}"
						end
						puts "Record ModifiedTime: #{record.modified_time}"
						puts "Record Field Value (Last_Name): #{record.get_key_value('Last_Name')}"
						puts "Record KeyValues:"
						record.get_key_values.each do |key, value|
							if value.is_a?(Array)
								puts "Record KeyName : #{key}"
								value.each do |data|
									if data.is_a?(Hash)
										puts "Record KeyName : #{key} - Value :"
										data.each { |k, v| puts "#{k} : #{v}" }
									else
										puts data
									end
								end
							elsif value.is_a?(Hash)
								puts "Record KeyName : #{key} - Value :"
								value.each { |k, v| puts "#{k} : #{v}" }
							else
								puts "Record KeyName : #{key} - Value : #{value}"
							end
						end
					end
				elsif response_handler.is_a?(ZOHOCRMSDK::DealContactRoles::APIException)
					exception = response_handler
					puts "Status: #{exception.status.value}"
					puts "Code: #{exception.code.value}"
					puts "Details:"
					exception.details.each { |key, value| puts "#{key}: #{value}" }
					puts "Message: #{exception.message}"
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
		else
			print "Error: No response received from server\n"
			print "Check your network connection and API configuration.\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_associated_contact_roles
		rescue Exception => e
			raise e
		end
	end
end

GetAssociatedContactRoles.initialize_and_call