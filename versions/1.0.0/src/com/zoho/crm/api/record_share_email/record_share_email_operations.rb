require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module RecordShareEmail
    class RecordShareEmailOperations

        # Creates an instance of RecordShareEmailOperations with the given parameters
        # @param module_api_name [String] A String
      def initialize(module_api_name)
        if !module_api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_api_name EXPECTED TYPE: String', nil, nil)
        end
        @module_api_name = module_api_name
      end

        # The method to share emails
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def share_emails(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + id.to_s
        api_path = api_path + '/actions/share_emails'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'ACTION'
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to unshare emails
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def unshare_emails(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + id.to_s
        api_path = api_path + '/actions/unshare_emails'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'ACTION'
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to share bulk emails
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def share_bulk_emails(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/actions/share_emails'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'ACTION'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to unshare bulk emails
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def unshare_bulk_emails(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + @module_api_name.to_s
        api_path = api_path + '/actions/unshare_emails'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'ACTION'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

    end
  end
end