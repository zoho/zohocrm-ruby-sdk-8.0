require "ZOHOCRMSDK8_0"

class GetInventoryTemplate
	def self.get_inventory_template
		template_id = 1055806000000174009  # Replace with actual template ID
		
		begin
			inventory_templates_operations = ZOHOCRMSDK::InventoryTemplates::InventoryTemplatesOperations.new
			
			response = inventory_templates_operations.get_inventory_template(template_id)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::InventoryTemplates::ResponseWrapper
						response_wrapper = response_handler
						inventory_templates_list = response_wrapper.inventory_templates
						
						if inventory_templates_list != nil && inventory_templates_list.length > 0
							template = inventory_templates_list[0]
							print "\n--- Template Details ---\n"
							
							if template.id != nil
								print "Template ID: " + template.id.to_s + "\n"
							end
							
							if template.name != nil
								print "Name: " + template.name + "\n"
							end
							
							if template.category != nil
								print "Category: " + template.category + "\n"
							end
							
							if template.editor_mode != nil
								print "Editor Mode: " + template.editor_mode + "\n"
							end
							
							if template.active != nil
								print "Active: " + template.active.to_s + "\n"
							end
							
							if template.favorite != nil
								print "Favorite: " + template.favorite.to_s + "\n"
							end
							
							if template.content != nil
								print "Content Length: " + template.content.length.to_s + " characters\n"
							end
							
							if template.mail_content != nil
								print "Mail Content Length: " + template.mail_content.length.to_s + " characters\n"
							end
							
							if template.folder != nil
								folder = template.folder
								print "Folder:\n"
								if folder.id != nil
									print "  ID: " + folder.id.to_s + "\n"
								end
								if folder.name != nil
									print "  Name: " + folder.name + "\n"
								end
							end
							
							if template.module != nil
								module_info = template.module
								print "Module:\n"
								if module_info.id != nil
									print "  ID: " + module_info.id.to_s + "\n"
								end
								if module_info.api_name != nil
									print "  API Name: " + module_info.api_name + "\n"
								end
							end
							
							if template.created_by != nil
								created_by = template.created_by
								print "Created By:\n"
								if created_by.id != nil
									print "  ID: " + created_by.id.to_s + "\n"
								end
								if created_by.name != nil
									print "  Name: " + created_by.name + "\n"
								end
							end
							
							if template.modified_by != nil
								modified_by = template.modified_by
								print "Modified By:\n"
								if modified_by.id != nil
									print "  ID: " + modified_by.id.to_s + "\n"
								end
								if modified_by.name != nil
									print "  Name: " + modified_by.name + "\n"
								end
							end
							
							if template.created_time != nil
								print "Created Time: " + template.created_time.to_s + "\n"
							end
							
							if template.modified_time != nil
								print "Modified Time: " + template.modified_time.to_s + "\n"
							end
							
							if template.last_usage_time != nil
								print "Last Usage Time: " + template.last_usage_time.to_s + "\n"
							end
						else
							print "No inventory template found\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::InventoryTemplates::APIException
						exception = response_handler
						print "API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Details: \n"
						if exception.details != nil
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
							end
						end
						print "Message: " + exception.message + "\n"
					end
					
				elsif response.status_code != 204
					response_object = response.data_object
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
					end
				end
			end
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
			get_inventory_template
		rescue Exception => e
			raise e
		end
	end
end

GetInventoryTemplate.initialize_and_call