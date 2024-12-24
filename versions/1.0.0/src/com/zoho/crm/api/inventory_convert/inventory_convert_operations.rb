require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module InventoryConvert
    class InventoryConvertOperations

        # Creates an instance of InventoryConvertOperations with the given parameters
        # @param id [Integer] A Integer
        # @param module_api_name [String] A String
      def initialize(id, module_api_name)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        if !module_api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_api_name EXPECTED TYPE: String', nil, nil)
        end
        @id = id
        @module_api_name = module_api_name
      end

        # The method to convert inventory
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def convert_inventory(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + @id.to_s
        api_path = api_path + '/actions/convert'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

    end
  end
end
