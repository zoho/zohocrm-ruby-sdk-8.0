require "ZOHOCRMSDK8_0"

class GetModuleByApiName
	def self.get_module_by_api_name
		api_name = "Leads"  # Replace with actual module API name (e.g., "Leads", "Contacts", "Accounts")
		
		begin
			modules_operations = ZOHOCRMSDK::Modules::ModulesOperations.new
			
			response = modules_operations.get_module_by_api_name(api_name)
			
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
							module_info = modules_list[0]  # First module in response
							print "Module Details for API Name: #{api_name}\n"
							
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
							
							# Module capabilities
							print "  Module Capabilities:\n"
							capabilities = []
							
							if module_info.feeds_required != nil && module_info.feeds_required
								capabilities.push("Feeds Required")
							end
							
							if module_info.scoring_supported != nil && module_info.scoring_supported
								capabilities.push("Scoring Supported")
							end
							
							if module_info.webform_supported != nil && module_info.webform_supported
								capabilities.push("Webform Supported")
							end
							
							if module_info.convertable != nil && module_info.convertable
								capabilities.push("Convertable")
							end
							
							if module_info.editable != nil && module_info.editable
								capabilities.push("Editable")
							end
							
							if module_info.deletable != nil && module_info.deletable
								capabilities.push("Deletable")
							end
							
							if module_info.creatable != nil && module_info.creatable
								capabilities.push("Creatable")
							end
							
							if module_info.show_as_tab != nil && module_info.show_as_tab
								capabilities.push("Show As Tab")
							end
							
							if capabilities.length > 0
								print "    " + capabilities.join(", ") + "\n"
							else
								print "    No special capabilities enabled\n"
							end
							
							# Module configuration
							print "  Configuration:\n"
							if module_info.web_link != nil
								print "    Web Link: " + module_info.web_link + "\n"
							end
							
							if module_info.sequence_number != nil
								print "    Sequence Number: " + module_info.sequence_number.to_s + "\n"
							end
							
							if module_info.status != nil
								print "    Status: " + module_info.status.to_s + "\n"
							end
							# Modified time
							if module_info.modified_time != nil
								print "  Modified Time: " + module_info.modified_time.to_s + "\n"
							end
							
							# Business card support
							if module_info.business_card_field_limit != nil
								print "  Business Card Field Limit: " + module_info.business_card_field_limit.to_s + "\n"
							end
							
							# Profiles information
							if module_info.profiles != nil && module_info.profiles.length > 0
								print "  Associated Profiles (#{module_info.profiles.length}):\n"
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
							
							# Per page counts (if available)
							if module_info.per_page != nil
								print "  Per Page: " + module_info.per_page.to_s + "\n"
							end
							
							# Visibility settings
							if module_info.visibility != nil
								print "  Visibility: " + module_info.visibility.to_s + "\n"
							end
							
							# Arguments (if any)
							if module_info.arguments != nil && module_info.arguments.length > 0
								print "  Arguments (#{module_info.arguments.length}):\n"
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
							
							print "Module retrieved successfully by API name!\n"
						else
							print "No module found with the API name: #{api_name}\n"
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
			get_module_by_api_name
		rescue Exception => e
			raise e
		end
	end
end

GetModuleByApiName.initialize_and_call