require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module EmailSignatures
    class EmailSignaturesOperations

        # Creates an instance of EmailSignaturesOperations
      def initialize()
      end

        # The method to get all email signatures
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_all_email_signatures(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose/email_signatures'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to create email signatures
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def create_email_signatures(request, param_instance=nil)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose/email_signatures'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.param = param_instance
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to update email signatures
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def update_email_signatures(request, param_instance=nil)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose/email_signatures'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.param = param_instance
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delete email signatures
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_email_signatures(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose/email_signatures'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.param = param_instance
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get email signature
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def get_email_signature(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose/email_signatures/'
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update email signature
        # @param id [String] A String
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_email_signature(id, request)
        if !id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: String', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose/email_signatures/'
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delete email signature
        # @param id [String] A String
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_email_signature(id)
        if !id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: String', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/email/v8/settings/compose/email_signatures/'
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

      class GetAllEmailSignaturesParam
          @@user_id =   Param.new('user_id', 'com.zoho.crm.api.EmailSignatures.GetAllEmailSignaturesParam')
        def self.user_id
          @@user_id
        end
      end

      class GetAllEmailSignaturesHeader
      end

      class CreateEmailSignaturesParam
          @@user_id =   Param.new('user_id', 'com.zoho.crm.api.EmailSignatures.CreateEmailSignaturesParam')
        def self.user_id
          @@user_id
        end
      end

      class CreateEmailSignaturesHeader
      end

      class UpdateEmailSignaturesParam
          @@user_id =   Param.new('user_id', 'com.zoho.crm.api.EmailSignatures.UpdateEmailSignaturesParam')
        def self.user_id
          @@user_id
        end
      end

      class UpdateEmailSignaturesHeader
      end

      class DeleteEmailSignaturesParam
          @@ids =   Param.new('ids', 'com.zoho.crm.api.EmailSignatures.DeleteEmailSignaturesParam')
        def self.ids
          @@ids
        end
      end

      class DeleteEmailSignaturesHeader
      end

      class GetEmailSignatureHeader
      end

      class UpdateEmailSignatureHeader
      end

      class DeleteEmailSignatureHeader
      end

    end
  end
end
