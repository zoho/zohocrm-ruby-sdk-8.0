require "ZOHOCRMSDK8_0"

class ExecuteFunctionUsingFile
		def self.execute_function_using_file
			function_name = "test_java"
			auth_type = "oauth"
			functions_operations = ZOHOCRMSDK::Functions::FunctionsOperations.new(function_name, auth_type, null)
			file_body_wrapper = ZOHOCRMSDK::Functions::FileBodyWrapper.new
			stream_wrapper = ZOHOCRMSDK::StreamWrapper.new("./sample.txt")
			file_body_wrapper.inputfile = stream_wrapper
			param_instance = ZOHOCRMSDK::ParameterMap.new
			param={}
			param.store("1221", "2111221")
			param.store("15221", "21113221")
			param.store("12421", "211341221")
			param_instance.add(ZOHOCRMSDK::Param.new("java", Map.name), param)
			header_instance = ZOHOCRMSDK::HeaderMap.new
			response = functions_operations.execute_function_using_file(file_body_wrapper, param_instance, header_instance)
			if response != nil
				print "status Code: " + response.status_code.to_s + "\n"
				if response.is_expected
					response_wrapper = response.data_object
					if response_wrapper.is_a? ZOHOCRMSDK::Functions::SuccessResponse
						success_response = response_wrapper
						print "code: " + success_response.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						success_response.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + success_response.message.value.to_s + "\n"
					elsif response_wrapper.is_a? ZOHOCRMSDK::Functions::APIException
						exception = response_wrapper
						print "status: " + exception.status.value.to_s + "\n"
						print "code: " + exception.code.value.to_s + "\n"
						print "details: ".to_s + "\n"
						exception.details.each do |k, v|
							print k + ": " + v.to_s + "\n"
						end
						print "message: " + exception.message.value.to_s + "\n"
					end
				else
          response_object = response.data_object
          response_object.instance_variables.each do |field_1|
            print field_1
            print "\n"
            print response_object.instance_variable_get(field_1)
					end
				end
			end
		end
	def self.initialize_and_call
			begin
				environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
				token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
				ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
				execute_function_using_file
			rescue Exception => e
				raise e
			end
		end
end
ExecuteFunctionUsingFile.initialize_and_call