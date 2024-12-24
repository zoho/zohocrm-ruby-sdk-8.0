require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/choice'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module EmailCompose
    class EmailComposeOperations

      # Creates an instance of EmailComposeOperations
      def initialize
      end

        # The method to get email composer default settings
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_email_composer_default_settings(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update email composer default settings
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_email_composer_default_settings(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

      class GetEmailComposerDefaultSettingsParam
          @@type =   Param.new('type', 'com.zoho.crm.api.EmailCompose.GetEmailComposerDefaultSettingsParam')
        def self.type
          @@type
        end
      end

    end
  end
end
