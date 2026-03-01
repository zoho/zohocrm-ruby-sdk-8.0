require 'ZOHOCRMSDK8_0'

class UpdatePipelines

  def self.update_pipelines
    layout_id = 1055806000000091023  # Replace with actual layout ID
    pipeline_operations = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    
    request = ZOHOCRMSDK::Pipeline::BodyWrapper.new
    pipelines = []
    
    pipeline = ZOHOCRMSDK::Pipeline::Pipeline.new
    pipeline.id = 1055806000029126001  # Pipeline ID to update
    pipeline.display_value = "Updated Sales Pipeline"
    pipeline.actual_value = "updated_sales_pipeline"
    pipeline.default = true    
    
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
    pipelines.push(pipeline)
    request.pipeline = pipelines
    
    response = pipeline_operations.update_pipelines(request)

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"
      if [204, 304].include?(response.status_code)
        print response.status_code == 204 ? "No Content" : "Not Modified"
        return
      end

      response_handler = response.data_object

      if response_handler.is_a?(ZOHOCRMSDK::Pipeline::ActionWrapper)
        action_wrapper = response_handler
        action_responses = action_wrapper.pipeline
        
        if action_responses != nil
          action_responses.each_with_index do |action_response, index|
            if action_response.is_a?(ZOHOCRMSDK::Pipeline::SuccessResponse)
              success_response = action_response
              print "Pipeline Update Successful:\n"
              print "  Status: " + success_response.status.value + "\n"
              print "  Code: " + success_response.code.value + "\n"
              print "  Message: " + success_response.message + "\n"
              
              if success_response.details != nil
                print "  Details:\n"
                success_response.details.each do |key, value|
                  print "    " + key + ": " + value.to_s + "\n"
                end
              end
            elsif action_response.is_a?(ZOHOCRMSDK::Pipeline::APIException)
              exception = action_response
              print "Pipeline Update Failed:\n"
              print "  Status: " + exception.status.value + "\n"
              print "  Code: " + exception.code.value + "\n"
              print "  Message: " + exception.message + "\n"
              
              if exception.details != nil
                print "  Details:\n"
                exception.details.each do |key, value|
                  print "    " + key + ": " + value.to_s + "\n"
                end
              end
            end
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
      environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      update_pipelines
    rescue Exception => e
      raise e
    end
  end
end

UpdatePipelines.initialize_and_call