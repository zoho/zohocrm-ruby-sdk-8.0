require "ZOHOCRMSDK8_0"

class GetProfiles
	def self.get_profiles
		begin
			profiles_operations = ZOHOCRMSDK::Profiles::ProfilesOperations.new
			
			# Create parameter map for optional parameters
			param_instance = ZOHOCRMSDK::ParameterMap.new
			
			# Add optional parameter to include lite profile
			param_instance.add(ZOHOCRMSDK::Profiles::ProfilesOperations::GetProfilesParam.include_lite_profile, true)
			
			response = profiles_operations.get_profiles(param_instance)
			
			if response != nil
				print "Status Code: " + response.status_code.to_s + "\n"
				
				if [204, 304].include?(response.status_code)
					print (response.status_code == 204 ? "No Content" : "Not Modified") + "\n"
					return
				end
				
				if response.is_expected
					response_handler = response.data_object
					
					if response_handler.is_a? ZOHOCRMSDK::Profiles::ResponseWrapper
						response_wrapper = response_handler
						profiles_list = response_wrapper.profiles
						
						if profiles_list != nil && profiles_list.length > 0
							profiles_list.each_with_index do |profile, index|
								# Basic profile information
								if profile.id != nil
									print "  Profile ID: " + profile.id.to_s + "\n"
								end
								
								if profile.name != nil
									print "  Profile Name: " + profile.name + "\n"
								end
								
								if profile.display_label != nil
									print "  Display Label: " + profile.display_label + "\n"
								end
								
								if profile.description != nil
									print "  Description: " + profile.description + "\n"
								end
								
								if profile.category != nil
									print "  Category: " + profile.category + "\n"
								end
								
								if profile.default != nil
									print "  Default: " + profile.default.to_s + "\n"
								end
								
								if profile.custom != nil
									print "  Custom: " + profile.custom.to_s + "\n"
								end
								
								# Created by information
								if profile.created_by != nil
									created_by = profile.created_by
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
								
								# Modified by information
								if profile.modified_by != nil
									modified_by = profile.modified_by
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
								
								if profile.created_time != nil
									print "  Created Time: " + profile.created_time.to_s + "\n"
								end
								
								if profile.modified_time != nil
									print "  Modified Time: " + profile.modified_time.to_s + "\n"
								end
								
								# Permissions information
								if profile.permissions_details != nil && profile.permissions_details.length > 0
									profile.permissions_details.first(5).each_with_index do |permission, perm_index|
										if permission.display_label != nil
											print "    #{perm_index + 1}. " + permission.display_label
											if permission.module != nil
												print " (Module: " + permission.module + ")"
											end
											print "\n"
										end
									end
								end
							end
						else
							print "No profiles found.\n"
						end
						
					elsif response_handler.is_a? ZOHOCRMSDK::Profiles::APIException
						exception = response_handler
						print "API Exception:\n"
						print "Status: " + exception.status.value + "\n"
						print "Code: " + exception.code.value + "\n"
						print "Message: " + exception.message.value + "\n"
						
						if exception.details != nil
							print "Details:\n"
							exception.details.each do |key, value|
								print "  " + key + ": " + value.to_s + "\n"
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
			get_profiles
		rescue Exception => e
			raise e
		end
	end
end

GetProfiles.initialize_and_call