require "ZOHOCRMSDK8_0"

class GetTags
	def self.get_tags
		begin
			# Initialize TagsOperations
			tags_operations = ZOHOCRMSDK::Tags::TagsOperations.new
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::GetTagsParam.module_1, "Leads")
			# param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::GetTagsParam.my_tags, "true")
			# param_instance.add(ZOHOCRMSDK::Tags::TagsOperations::GetTagsParam.include, "created_by")
			
			response = tags_operations.get_tags(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - No tags found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Tags::ResponseWrapper
						response_wrapper = response_handler
						tags = response_wrapper.tags
						
						if tags != nil && tags.length > 0
							print "Total Tags Found: " + tags.length.to_s + "\n\n"
							
							tags.each_with_index do |tag, index|
								
								if tag.created_time != nil
									print "Created Time: " + tag.created_time.to_s + "\n"
								end
								
								if tag.modified_time != nil
									print "Modified Time: " + tag.modified_time.to_s + "\n"
								end
								
								if tag.name != nil
									print "Tag Name: " + tag.name + "\n"
								end
								
								if tag.modified_by != nil
									modified_by = tag.modified_by
									if modified_by.is_a? ZOHOCRMSDK::Users::MinifiedUser
										print "Modified By: " + (modified_by.name || "N/A") + " (ID: " + (modified_by.id || "N/A").to_s + ")\n"
									else
										print "Modified By: " + modified_by.to_s + "\n"
									end
								end
								
								if tag.id != nil
									print "Tag ID: " + tag.id.to_s + "\n"
								end
								
								if tag.created_by != nil
									created_by = tag.created_by
									if created_by.is_a? ZOHOCRMSDK::Users::MinifiedUser
										print "Created By: " + (created_by.name || "N/A") + " (ID: " + (created_by.id || "N/A").to_s + ")\n"
									else
										print "Created By: " + created_by.to_s + "\n"
									end
								end
								
								if tag.color_code != nil
									print "Color Code: " + tag.color_code + "\n"
								end
								
								print "\n"
							end
						else
							print "No tags found.\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Tags::APIException
						exception = response_handler
						print "Tags API Exception:\n"
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
				else
					response_object = response.data_object
					response_object.instance_variables.each do |field|
						print field.to_s + "\n"
						print response_object.instance_variable_get(field).to_s + "\n"
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
			get_tags
		rescue Exception => e
			raise e
		end
	end
end

GetTags.initialize_and_call