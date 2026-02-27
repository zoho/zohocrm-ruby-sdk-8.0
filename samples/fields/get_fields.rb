require "ZOHOCRMSDK8_0"

class GetFields
	def self.get_fields
		fields_operations = ZOHOCRMSDK::Fields::FieldsOperations.new
		
		# Create parameter map for optional parameters
		param_instance = ZOHOCRMSDK::ParameterMap.new
		
		# Set module parameter (required)
		param_instance.add(ZOHOCRMSDK::Fields::FieldsOperations::GetFieldsParam.module_1, "Leads")
		response = fields_operations.get_fields(param_instance)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::Fields::ResponseWrapper
					response_wrapper = response_handler
					fields_list = response_wrapper.fields
					
					if fields_list != nil && fields_list.length > 0
						print "Total Fields: " + fields_list.length.to_s + "\n"
						
						fields_list.each_with_index do |field, index|
							print "\n--- Field #{index + 1} ---\n"
							
							# Basic field information
							if field.id != nil
								print "  Field ID: " + field.id.to_s + "\n"
							end
							
							if field.api_name != nil
								print "  API Name: " + field.api_name + "\n"
							end
							
							if field.display_label != nil
								print "  Display Label: " + field.display_label + "\n"
							end
							
							if field.field_label != nil
								print "  Field Label: " + field.field_label + "\n"
							end
							
							if field.data_type != nil
								print "  Data Type: " + field.data_type + "\n"
							end
							
							if field.length != nil
								print "  Length: " + field.length.to_s + "\n"
							end
							
							if field.sequence_number != nil
								print "  Sequence Number: " + field.sequence_number.to_s + "\n"
							end
							
							if field.read_only != nil
								print "  Read Only: " + field.read_only.to_s + "\n"
							end
							
							if field.system_mandatory != nil
								print "  System Mandatory: " + field.system_mandatory.to_s + "\n"
							end
							
							if field.custom_field != nil
								print "  Custom Field: " + field.custom_field.to_s + "\n"
							end
							
							if field.visible != nil
								print "  Visible: " + field.visible.to_s + "\n"
							end
							
							# Field type information
							if field.json_type != nil
								print "  JSON Type: " + field.json_type + "\n"
							end
							
							# Pick list values for dropdown fields
							if field.pick_list_values != nil && field.pick_list_values.length > 0
								print "  Pick List Values:\n"
								field.pick_list_values.each_with_index do |pick_value, pick_index|
									if pick_value.display_value != nil
										print "    #{pick_index + 1}. " + pick_value.display_value
										if pick_value.actual_value != nil
											print " (" + pick_value.actual_value + ")"
										end
										print "\n"
									end
								end
							end
							# Lookup information
							if field.lookup != nil
								lookup = field.lookup
								print "  Lookup:\n"
								
								if lookup.display_label != nil
									print "    Display Label: " + lookup.display_label + "\n"
								end
								
								if lookup.api_name != nil
									print "    API Name: " + lookup.api_name + "\n"
								end
								
								if lookup.module != nil
									module_info = lookup.module
									if module_info.api_name != nil
										print "    Module: " + module_info.api_name + "\n"
									end
								end
							end
							
							# Currency information
							if field.currency != nil
								currency = field.currency
								print "  Currency:\n"
								
								if currency.precision != nil
									print "    Precision: " + currency.precision.to_s + "\n"
								end
								
								if currency.rounding_option != nil
									print "    Rounding Option: " + currency.rounding_option.value + "\n"
								end
							end
						end
					else
						print "No fields found for the specified module.\n"
					end
					
				elsif response_handler.is_a? ZOHOCRMSDK::Fields::APIException
					exception = response_handler
					print "API Exception:\n"
					print "Status: " + exception.status.value + "\n"
					print "Code: " + exception.code.value + "\n"
					print "Details:\n"
					if exception.details != nil
						exception.details.each do |key, value|
							print "  " + key + ": " + value.to_s + "\n"
						end
					end
					print "Message: " + exception.message.value + "\n"
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
			get_fields
		rescue Exception => e
			raise e
		end
	end
end

GetFields.initialize_and_call