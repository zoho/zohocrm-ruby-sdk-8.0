require 'ZOHOCRMSDK8_0'

class GetPipeline

  def self.get_pipeline
    layout_id = 1055806000000091023  # Replace with actual layout ID
    pipeline_id = 1055806000029126001  # Replace with actual pipeline ID
    
    pipeline_operations = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    response = pipeline_operations.get_pipeline(pipeline_id)

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"
      if [204, 304].include?(response.status_code)
        print response.status_code == 204 ? "No Content" : "Not Modified"
        return
      end

      response_handler = response.data_object

      if response_handler.is_a?(ZOHOCRMSDK::Pipeline::ResponseWrapper)
        response_wrapper = response_handler
        pipelines = response_wrapper.pipeline
        
        if pipelines != nil && pipelines.length > 0
          pipeline = pipelines[0]
          print "Pipeline Details:\n"
          print "  ID: " + pipeline.id.to_s + "\n" if pipeline.id != nil
          print "  Display Value: " + pipeline.display_value + "\n" if pipeline.display_value != nil
          print "  Actual Value: " + pipeline.actual_value + "\n" if pipeline.actual_value != nil
          print "  Default: " + pipeline.default.to_s + "\n" if pipeline.default != nil
          print "  Child Available: " + pipeline.child_available.to_s + "\n" if pipeline.child_available != nil
          
          if pipeline.parent != nil
            print "  Parent Pipeline:\n"
            print "    ID: " + pipeline.parent.id.to_s + "\n" if pipeline.parent.id != nil
            print "    Display Value: " + pipeline.parent.display_value + "\n" if pipeline.parent.display_value != nil
          end
          
          if pipeline.maps != nil
            print "  Pipeline Stages (#{pipeline.maps.length}):\n"
            pipeline.maps.each_with_index do |map, index|
              print "    Stage #{index + 1}:\n"
              print "      ID: " + map.id.to_s + "\n" if map.id != nil
              print "      Display Value: " + map.display_value + "\n" if map.display_value != nil
              print "      Actual Value: " + map.actual_value + "\n" if map.actual_value != nil
              print "      Sequence Number: " + map.sequence_number.to_s + "\n" if map.sequence_number != nil
              print "      Colour Code: " + map.colour_code + "\n" if map.colour_code != nil
              
              if map.forecast_category != nil
                print "      Forecast Category:\n"
                print "        ID: " + map.forecast_category.id.to_s + "\n" if map.forecast_category.id != nil
                print "        Name: " + map.forecast_category.name + "\n" if map.forecast_category.name != nil
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
      environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      get_pipeline
    rescue Exception => e
      raise e
    end
  end
end

GetPipeline.initialize_and_call