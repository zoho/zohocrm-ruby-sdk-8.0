require 'ZOHOCRMSDK8_0'

class UpdatePipeline

  def self.update_pipeline
    layout_id = 1055806000000091023  # Replace with actual layout ID
    pipeline_id = 1055806000029126001  # Replace with actual pipeline ID
    
    pipeline_operations = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    
    pipeline = ZOHOCRMSDK::Pipeline::Pipeline.new
    pipeline.display_value = "Updated Pipeline Name"
    pipeline.actual_value = "Updated_Pipeline"
    
    maps = Array.new
    
    map1 = ZOHOCRMSDK::Pipeline::Maps.new
    map1.display_value = "Lead"
    map1.actual_value = "lead"
    map1.sequence_number = 1
    map1.colour_code = "#F44336"
    map1.id = 1055806000000006801
    
    forecast_category1 = ZOHOCRMSDK::Pipeline::ForecastCategory.new
    forecast_category1.name = "Pipeline"
    forecast_category1.id = 1055806000000006787
    map1.forecast_category = forecast_category1
    
    maps.push(map1)
    
    pipeline.maps = maps
    
    body_wrapper = ZOHOCRMSDK::Pipeline::BodyWrapper.new
    body_wrapper.pipeline = [pipeline]
    
    response = pipeline_operations.update_pipeline(pipeline_id, body_wrapper)

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"
      if [204, 304].include?(response.status_code)
        print response.status_code == 204 ? "No Content" : "Not Modified"
        return
      end

      response_handler = response.data_object

      if response_handler.is_a?(ZOHOCRMSDK::Pipeline::ActionWrapper)
        action_wrapper = response_handler
        action_response_list = action_wrapper.pipeline
        
        action_response_list.each_with_index do |action_response, index|
          if action_response.is_a?(ZOHOCRMSDK::Pipeline::SuccessResponse)
            success_response = action_response
            print "Pipeline #{index + 1} Update Status: SUCCESS\n"
            print "  Status: " + success_response.status.value.to_s + "\n"
            print "  Code: " + success_response.code.value.to_s + "\n"
            
            if success_response.details != nil && success_response.details.size > 0
              print "  Details: " + "\n"
              success_response.details.each do |keyName, keyValue|
                print "    " + keyName + ": " + keyValue.to_s + "\n"
              end
            end
            print "  Message: " + success_response.message.to_s + "\n"
          elsif action_response.is_a?(ZOHOCRMSDK::Pipeline::APIException)
            api_exception = action_response
            print "Pipeline #{index + 1} Update Status: ERROR\n"
            print "  status: " + api_exception.status.value.to_s + "\n"
            print "  code: " + api_exception.code.value.to_s + "\n"
            
            if api_exception.details != nil && api_exception.details.size > 0
              print "  details: " + "\n"
              api_exception.details.each do |keyName, keyValue|
                print "    " + keyName + ": " + keyValue.to_s + "\n"
              end
            end
            print "  message: " + api_exception.message.to_s + "\n"
          end
        end
      elsif response_handler.is_a?(ZOHOCRMSDK::Pipeline::APIException)
        exception = response_handler
        print "status: " + exception.status.value.to_s + "\n"
        print "code: " + exception.code.value.to_s + "\n"
        print "details: ".to_s + "\n"
        exception.details.each do |k, v|
          print k + ": " + v.to_s + "\n"
        end
        print "message: " + exception.message.to_s + "\n"
      end
    end
  end

  def self.initialize_and_call
    begin
      environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      update_pipeline
    rescue Exception => e
      raise e
    end
  end
end

UpdatePipeline.initialize_and_call