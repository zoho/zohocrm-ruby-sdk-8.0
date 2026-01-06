require "ZOHOCRMSDK8_0"

class GetLayouts
	def self.get_layouts
		module_name = "Leads"  # Can be Leads, Contacts, Accounts, etc.
		
		begin
			layouts_operations = ZOHOCRMSDK::Layouts::LayoutsOperations.new
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Layouts::LayoutsOperations::GetLayoutsParam.module_1, module_name)
			
			response = layouts_operations.get_layouts(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Layouts::ResponseWrapper
						response_wrapper = response_handler
						layouts_list = response_wrapper.layouts
						
						if layouts_list != nil && layouts_list.length > 0
							print "Total Layouts: " + layouts_list.length.to_s + "\n"
							
							layouts_list.each_with_index do |layout, index|
								print "\n--- Layout #{index + 1} ---\n"
								
								# Basic layout information
								if layout.id != nil
									print "  Layout ID: " + layout.id.to_s + "\n"
								end
								
								if layout.name != nil
									print "  Name: " + layout.name + "\n"
								end
								
								if layout.display_type != nil
									print "  Display Type: " + layout.display_type + "\n"
								end
								
								if layout.status != nil
									print "  Status: " + layout.status.to_s + "\n"
								end
								
								if layout.created_for != nil
									print "  Created For: " + layout.created_for + "\n"
								end
								
								if layout.visible != nil
									print "  Visible: " + layout.visible.to_s + "\n"
								end
								# Created by information
								if layout.created_by != nil
									created_by = layout.created_by
									print "  Created By:\n"
									
									if created_by.id != nil
										print "    ID: " + created_by.id.to_s + "\n"
									end
									
									if created_by.name != nil
										print "    Name: " + created_by.name + "\n"
									end
									
									if created_by.email != nil
										print "    Email: " + created_by.email + "\n"
									end
								end
								
								# Created time
								if layout.created_time != nil
									print "  Created Time: " + layout.created_time.to_s + "\n"
								end
								
								# Modified by information
								if layout.modified_by != nil
									modified_by = layout.modified_by
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
								if layout.modified_time != nil
									print "  Modified Time: " + layout.modified_time.to_s + "\n"
								end
								
								# Profiles information
								if layout.profiles != nil && layout.profiles.length > 0
									print "  Profiles:\n"
									layout.profiles.each_with_index do |profile, profile_index|
										if profile.id != nil && profile.name != nil
											print "    #{profile_index + 1}. " + profile.name + " (ID: " + profile.id.to_s + ")\n"
										end
									end
								end
								
								# Sections information
								if layout.sections != nil && layout.sections.length > 0
									print "  Sections Count: " + layout.sections.length.to_s + "\n"
									layout.sections.each_with_index do |section, section_index|
										if section.name != nil
											print "    Section #{section_index + 1}: " + section.name
											if section.column_count != nil
												print " (Columns: " + section.column_count.to_s + ")"
											end
											print "\n"
										end
									end
								end
							end
						else
							print "No layouts found for the specified module.\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Layouts::APIException
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
			get_layouts
		rescue Exception => e
			raise e
		end
	end
end

GetLayouts.initialize_and_call