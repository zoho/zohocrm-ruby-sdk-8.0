require "ZOHOCRMSDK8_0"

class GetField
	def self.get_field
		field_id = 1055806000026707004  # Replace with actual field ID
		
		fields_operations = ZOHOCRMSDK::Fields::FieldsOperations.new
		
		# Create parameter map for module parameter
		param_instance = ZOHOCRMSDK::ParameterMap.new
		param_instance.add(ZOHOCRMSDK::Fields::FieldsOperations::GetFieldParam.module_1, "Leads")
		
		response = fields_operations.get_field(field_id, param_instance)
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
						field = fields_list[0]
						print "\n--- Field Details ---\n"
						
						# Basic field information
						if field.id != nil
							print "Field ID: " + field.id.to_s + "\n"
						end
						
						if field.api_name != nil
							print "API Name: " + field.api_name + "\n"
						end
						
						if field.display_label != nil
							print "Display Label: " + field.display_label + "\n"
						end
						
						if field.field_label != nil
							print "Field Label: " + field.field_label + "\n"
						end
						
						if field.data_type != nil
							print "Data Type: " + field.data_type + "\n"
						end
						
						if field.length != nil
							print "Length: " + field.length.to_s + "\n"
						end
						
						if field.sequence_number != nil
							print "Sequence Number: " + field.sequence_number.to_s + "\n"
						end
						
						if field.read_only != nil
							print "Read Only: " + field.read_only.to_s + "\n"
						end
						
						if field.system_mandatory != nil
							print "System Mandatory: " + field.system_mandatory.to_s + "\n"
						end
						
						if field.custom_field != nil
							print "Custom Field: " + field.custom_field.to_s + "\n"
						end
						
						if field.visible != nil
							print "Visible: " + field.visible.to_s + "\n"
						end
						
						if field.default_value != nil
							print "Default Value: " + field.default_value.to_s + "\n"
						end
						
						# Field type and validation information
						if field.json_type != nil
							print "JSON Type: " + field.json_type + "\n"
						end
						
						if field.tooltip != nil
							tooltip = field.tooltip
							if tooltip.name != nil
								print "Tooltip: " + tooltip.name + "\n"
							end
						end
						
						# Pick list values for dropdown fields
						if field.pick_list_values != nil && field.pick_list_values.length > 0
							print "\nPick List Values:\n"
							field.pick_list_values.each_with_index do |pick_value, index|
								print "  #{index + 1}. "
								
								if pick_value.display_value != nil
									print pick_value.display_value
								end
								
								if pick_value.actual_value != nil
									print " (" + pick_value.actual_value + ")"
								end
								
								if pick_value.sequence_number != nil
									print " [Seq: " + pick_value.sequence_number.to_s + "]"
								end
								
								if pick_value.maps != nil && pick_value.maps.length > 0
									print " [Maps: " + pick_value.maps.length.to_s + "]"
								end
								
								print "\n"
							end
						end
						
						# Auto number information
						if field.auto_number_61 != nil
							auto_number = field.auto_number_61
							print "\nAuto Number:\n"
							
							if auto_number.prefix != nil
								print "  Prefix: " + auto_number.prefix + "\n"
							end
							
							if auto_number.suffix != nil
								print "  Suffix: " + auto_number.suffix + "\n"
							end
							
							if auto_number.start_number != nil
								print "  Start Number: " + auto_number.start_number.to_s + "\n"
							end
						end
						
						# Lookup information
						if field.lookup != nil
							lookup = field.lookup
							print "\nLookup:\n"
							
							if lookup.display_label != nil
								print "  Display Label: " + lookup.display_label + "\n"
							end
							
							if lookup.api_name != nil
								print "  API Name: " + lookup.api_name + "\n"
							end
							
							if lookup.module != nil
								module_info = lookup.module
								if module_info.api_name != nil
									print "  Module: " + module_info.api_name + "\n"
								end
							end
						end
						
						# Formula information
						if field.formula != nil
							formula = field.formula
							print "\nFormula:\n"
							
							if formula.return_type != nil
								print "  Return Type: " + formula.return_type + "\n"
							end
							
							if formula.expression != nil
								print "  Expression: " + formula.expression + "\n"
							end
						end
						
						# Currency information
						if field.currency != nil
							currency = field.currency
							print "\nCurrency:\n"
							
							if currency.precision != nil
								print "  Precision: " + currency.precision.to_s + "\n"
							end
							
							if currency.rounding_option != nil
								print "  Rounding Option: " + currency.rounding_option + "\n"
							end
						end
						
						# History tracking and other metadata
						if field.history_tracking != nil && field.history_tracking.length > 0
							print "\nHistory Tracking: " + field.history_tracking.length.to_s + " modules\n"
						end
						
						# Created and modified information
						if field.created_time != nil
							print "\nCreated Time: " + field.created_time.to_s + "\n"
						end
						
						if field.modified_time != nil
							print "Modified Time: " + field.modified_time.to_s + "\n"
						end
					else
						print "No field details found.\n"
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
			get_field
		rescue Exception => e
			raise e
		end
	end
end

GetField.initialize_and_call