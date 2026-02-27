require "ZOHOCRMSDK8_0"

class GetRelatedList
	def self.get_related_list
		begin
			# Set the related list ID to retrieve
			related_list_id = 1055806000012042048 # Replace with actual related list ID
			
			# Initialize RelatedListsOperations with optional layout_id
			layout_id = nil # Set layout_id if you want to filter by specific layout
			related_lists_operations = ZOHOCRMSDK::RelatedLists::RelatedListsOperations.new(layout_id)
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Add optional parameter to filter by module
			param_instance.add(ZOHOCRMSDK::RelatedLists::RelatedListsOperations::GetRelatedListParam.module_1, "Leads")
			response = related_lists_operations.get_related_list(related_list_id, param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content - Related list not found" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::RelatedLists::ResponseWrapper
						response_wrapper = response_handler
						related_lists = response_wrapper.related_lists
						
						if related_lists != nil && related_lists.length > 0
							related_lists.each_with_index do |related_list, index|
								if related_list.id != nil
									print "  ID: " + related_list.id.to_s + "\n"
								end
								
								if related_list.sequence_number != nil
									print "  Sequence Number: " + related_list.sequence_number.to_s + "\n"
								end
								
								if related_list.display_label != nil
									print "  Display Label: " + related_list.display_label + "\n"
								end
								
								if related_list.api_name != nil
									print "  API Name: " + related_list.api_name + "\n"
								end
								
								if related_list.module != nil
									print "  Module: " + related_list.module.api_name + "\n"
								end
							
								if related_list.name != nil
									print "  Name: " + related_list.name + "\n"
								end
								
								if related_list.action != nil
									print "  Action: " + related_list.action + "\n"
								end
								
								if related_list.href != nil
									print "  Href: " + related_list.href + "\n"
								end
								
								if related_list.type != nil
									print "  Type: " + related_list.type + "\n"
								end
								
								if related_list.connectedmodule != nil
									print "  Connected Module: " + related_list.connectedmodule + "\n"
								end
							
								if related_list.linkingmodule != nil
									print "  Linking Module: " + related_list.linkingmodule + "\n"
									# Status flags
								end
							end
						end
					elsif response_handler.is_a? ZOHOCRMSDK::RelatedLists::APIException
						exception = response_handler
						print "Related Lists API Exception:\n"
						print "   Status: " + exception.status.value + "\n"
						print "   Code: " + exception.code.value + "\n"
						print "   Message: " + exception.message.value + "\n"
						
						if exception.details != nil
							print "   Details:\n"
							exception.details.each do |key, value|
								print "     " + key + ": " + value.to_s + "\n"
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
			get_related_list
		rescue Exception => e
			raise e
		end
	end
end

GetRelatedList.initialize_and_call