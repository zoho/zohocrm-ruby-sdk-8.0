require "ZOHOCRMSDK8_0"

class GetModules
	def self.get_modules
		begin
			modules_operations = ZOHOCRMSDK::Modules::ModulesOperations.new
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Add optional parameters
			# param_instance.add(ZOHOCRMSDK::Modules::ModulesOperations::GetModulesParam.status, "active")
			
			# Create header map for optional headers
			header_instance = ZOHOCRMSDK::HeaderMap.new
			
			# Add optional headers
			# header_instance.add(ZOHOCRMSDK::Modules::ModulesOperations::GetModulesHeader.If_modified_since, DateTime.new(2023, 1, 1))
			
			response = modules_operations.get_modules(param_instance, header_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Modules::ResponseWrapper
						response_wrapper = response_handler
						modules_list = response_wrapper.modules
						
						if modules_list != nil && modules_list.length > 0
							print "Total Modules: " + modules_list.length.to_s + "\n"
							
							modules_list.each_with_index do |module_info, index|
								print "\n--- Module #{index + 1} ---\n"
								
								# Basic module information
								if module_info.id != nil
									print "  Module ID: " + module_info.id.to_s + "\n"
								end
								
								if module_info.api_name != nil
									print "  API Name: " + module_info.api_name + "\n"
								end
								
								if module_info.module_name != nil
									print "  Module Name: " + module_info.module_name + "\n"
								end
								
								if module_info.plural_label != nil
									print "  Plural Label: " + module_info.plural_label + "\n"
								end
								
								if module_info.singular_label != nil
									print "  Singular Label: " + module_info.singular_label + "\n"
								end
								
								if module_info.generated_type != nil
									print "  Generated Type: " + module_info.generated_type.value + "\n"
								end
								
								if module_info.feeds_required != nil
									print "  Feeds Required: " + module_info.feeds_required.to_s + "\n"
								end
								
								if module_info.scoring_supported != nil
									print "  Scoring Supported: " + module_info.scoring_supported.to_s + "\n"
								end
								
								if module_info.webform_supported != nil
									print "  Webform Supported: " + module_info.webform_supported.to_s + "\n"
								end
								
								if module_info.convertable != nil
									print "  Convertable: " + module_info.convertable.to_s + "\n"
								end
								
								if module_info.editable != nil
									print "  Editable: " + module_info.editable.to_s + "\n"
								end
								
								if module_info.deletable != nil
									print "  Deletable: " + module_info.deletable.to_s + "\n"
								end
								
								if module_info.creatable != nil
									print "  Creatable: " + module_info.creatable.to_s + "\n"
								end
								
								if module_info.show_as_tab != nil
									print "  Show As Tab: " + module_info.show_as_tab.to_s + "\n"
								end
								
								if module_info.web_link != nil
									print "  Web Link: " + module_info.web_link + "\n"
								end
								
								if module_info.sequence_number != nil
									print "  Sequence Number: " + module_info.sequence_number.to_s + "\n"
								end
								
								# Module status
								if module_info.status != nil
									print "  Status: " + module_info.status.to_s + "\n"
								end
								# Modified by information
								if module_info.modified_by != nil
									modified_by = module_info.modified_by
									print "  Modified By:\n"
									
									if modified_by.id != nil
										print "    ID: " + modified_by.id.to_s + "\n"
									end
									
									if modified_by.name != nil
										print "    Name: " + modified_by.name + "\n"
									end
									
									if modified_by.email != nil
										print "    Email: " + modified_by.email + "\n"
									end
								end
								
								# Modified time
								if module_info.modified_time != nil
									print "  Modified Time: " + module_info.modified_time.to_s + "\n"
								end
								
								# Profiles information
								if module_info.profiles != nil && module_info.profiles.length > 0
									print "  Associated Profiles:\n"
									module_info.profiles.each_with_index do |profile, profile_index|
										if profile.id != nil && profile.name != nil
											print "    #{profile_index + 1}. " + profile.name + " (ID: " + profile.id.to_s + ")\n"
										end
									end
								end
								
								# Related list properties
								if module_info.related_list_properties != nil
									related_list_props = module_info.related_list_properties
									print "  Related List Properties:\n"
									
									if related_list_props.sort_by != nil
										print "    Sort By: " + related_list_props.sort_by + "\n"
									end
									
									if related_list_props.sort_order != nil
										print "    Sort Order: " + related_list_props.sort_order + "\n"
									end
									
									if related_list_props.fields != nil && related_list_props.fields.length > 0
										print "    Fields: " + related_list_props.fields.join(", ") + "\n"
									end
								end
								
								# Arguments (if any)
								if module_info.arguments != nil && module_info.arguments.length > 0
									print "  Arguments:\n"
									module_info.arguments.each_with_index do |argument, arg_index|
										if argument.name != nil
											print "    #{arg_index + 1}. " + argument.name
											if argument.value != nil
												print " = " + argument.value
											end
											print "\n"
										end
									end
								end
							end
						else
							print "No modules found.\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Modules::APIException
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
			
		rescue ZOHOCRMSDK::SDKException => e
			print "SDKException:\n"
			print "Error Code: " + e.code.to_s + "\n"
			print "Error Message: " + e.message + "\n"
			print "Error Details: " + e.details.to_s + "\n"
			
		rescue Exception => e
			print "Exception:\n"
			print e.message + "\n"
			print e.backtrace.join("\n") + "\n"
		end
	end

	def self.initialize_and_call
		begin
			environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
			token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
			ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
			get_modules
		rescue Exception => e
			raise e
		end
	end
end

GetModules.initialize_and_call