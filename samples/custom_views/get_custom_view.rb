require "ZOHOCRMSDK8_0"

class GetCustomView
	def self.get_custom_view
		custom_view_id = 1055806000000087501  # Replace with actual custom view ID
		
		custom_views_operations = ZOHOCRMSDK::CustomViews::CustomViewsOperations.new
		
		# Create parameter map for module parameter
		param_instance = ZOHOCRMSDK::ParameterMap.new
		param_instance.add(ZOHOCRMSDK::CustomViews::CustomViewsOperations::GetCustomViewParam.module_1, "Leads")
		
		response = custom_views_operations.get_custom_view(custom_view_id, param_instance)
		if response != nil
			print "Status Code: " + response.status_code.to_s + "\n"
			
			if [204, 304].include?(response.status_code)
				print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
				return
			end
			
			if response.is_expected
				response_handler = response.data_object
				
				if response_handler.is_a? ZOHOCRMSDK::CustomViews::ResponseWrapper
					response_wrapper = response_handler
					custom_views_list = response_wrapper.custom_views
					
					if custom_views_list != nil && custom_views_list.length > 0
						custom_views_list.each_with_index do |custom_view, index|
							# Basic custom view information
							if custom_view.id != nil
								print "  Custom View ID: " + custom_view.id.to_s + "\n"
							end
							
							if custom_view.name != nil
								print "  Name: " + custom_view.name + "\n"
							end
							
							if custom_view.display_value != nil
								print "  Display Value: " + custom_view.display_value + "\n"
							end
							
							if custom_view.system_name != nil
								print "  System Name: " + custom_view.system_name + "\n"
							end
							
							if custom_view.category != nil
								print "  Category: " + custom_view.category + "\n"
							end
							
							if custom_view.sort_by != nil
								print "  Sort By: " + custom_view.sort_by + "\n"
							end
							
							if custom_view.sort_order != nil
								print "  Sort Order: " + custom_view.sort_order + "\n"
							end
							
							if custom_view.favorite != nil
								print "  Favorite: " + custom_view.favorite.to_s + "\n"
							end
							
							if custom_view.default != nil
								print "  Default: " + custom_view.default.to_s + "\n"
							end
							
							if custom_view.system_defined != nil
								print "  System Defined: " + custom_view.system_defined.to_s + "\n"
							end
							
							# Criteria information
							if custom_view.criteria != nil
								criteria = custom_view.criteria
								print "  Criteria:\n"
								
								if criteria.comparator != nil
									print "    Comparator: " + criteria.comparator + "\n"
								end
								
								if criteria.group != nil && criteria.group.length > 0
									print "    Groups: " + criteria.group.length.to_s + "\n"
								end
							end
							
							# Created and modified information
							if custom_view.created_time != nil
								print "  Created Time: " + custom_view.created_time.to_s + "\n"
							end
							
							if custom_view.modified_time != nil
								print "  Modified Time: " + custom_view.modified_time.to_s + "\n"
							end
							
							if custom_view.created_by != nil
								created_by = custom_view.created_by
								if created_by.name != nil
									print "  Created By: " + created_by.name + "\n"
								end
							end
							
							if custom_view.modified_by != nil
								modified_by = custom_view.modified_by
								if modified_by.name != nil
									print "  Modified By: " + modified_by.name + "\n"
								end
							end
						end
					else
						print "No custom views found for the specified module.\n"
					end
					
				elsif response_handler.is_a? ZOHOCRMSDK::CustomViews::APIException
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
			get_custom_view
		rescue Exception => e
			raise e
		end
	end
end

GetCustomView.initialize_and_call