require 'ZOHOCRMSDK8_0'

class TransferPipelines

  def self.transfer_pipelines
    layout_id = 1055806000000091023  # Replace with actual layout ID
    
    pipeline_operations = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    
    transfer_pipeline_wrapper = ZOHOCRMSDK::Pipeline::TransferPipelineWrapper.new
    
    transfer_pipeline = ZOHOCRMSDK::Pipeline::TransferPipeline.new
    
    pipeline = ZOHOCRMSDK::Pipeline::TPipeline.new
    pipeline.from = 1055806000000091001
    pipeline.to = 1055806000000091001
    transfer_pipeline.pipeline = pipeline
    
    stages = ZOHOCRMSDK::Pipeline::Stages.new
    stages.from = 1055806000000092001  # From stage ID
    stages.to = 1055806000000092002    # To stage ID
    transfer_pipeline.stages = [stages]
    
    transfer_pipeline_wrapper.transfer_pipeline = [transfer_pipeline]
    
    response = pipeline_operations.transfer_pipelines(transfer_pipeline_wrapper)

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"
      if [204, 304].include?(response.status_code)
        print response.status_code == 204 ? "No Content" : "Not Modified"
        return
      end

      response_handler = response.data_object

      if response_handler.is_a?(ZOHOCRMSDK::Pipeline::TransferPipelineActionWrapper)
        action_wrapper = response_handler
        action_response_list = action_wrapper.transfer_pipeline
        
        action_response_list.each_with_index do |action_response, index|
          if action_response.is_a?(ZOHOCRMSDK::Pipeline::TransferPipelineSuccessResponse)
            success_response = action_response
            print "Pipeline Transfer #{index + 1} Status: SUCCESS\n"
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
            print "Pipeline Transfer #{index + 1} Status: ERROR\n"
            print "  status: " + api_exception.status.value.to_s + "\n"
            print "  code: " + api_exception.code.value.to_s + "\n"
            
            if api_exception.details != nil && api_exception.details.size > 0
              print "  details: " + "\n"
              api_exception.details.each do |keyName, keyValue|
                print "    " + keyName + ": " + keyValue.to_s + "\n"
              end
            end
            print "  message: " + api_exception.message.value.to_s + "\n"
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
        print "message: " + exception.message.value.to_s + "\n"
      end
    end
  end

  def self.initialize_and_call
    begin
      environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      transfer_pipelines
    rescue Exception => e
      raise e
    end
  end
end

TransferPipelines.initialize_and_call