require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module SharingRules
    class SharingRulesOperations

        # Creates an instance of SharingRulesOperations with the given parameters
        # @param module_1 [String] A String
      def initialize(module_1=nil)
        if module_1!=nil and !module_1.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: String', nil, nil)
        end
        @module_1 = module_1
      end

        # The method to get sharing rules
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_sharing_rules(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.GetSharingRulesParam'), @module_1)
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to create sharing rules
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def create_sharing_rules(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.CreateSharingRulesParam'), @module_1)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to update sharing rules
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_sharing_rules(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.UpdateSharingRulesParam'), @module_1)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get sharing rule
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def get_sharing_rule(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/'
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.GetSharingRuleParam'), @module_1)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update sharing rule
        # @param id [Integer] A Integer
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_sharing_rule(id, request)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/'
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.UpdateSharingRuleParam'), @module_1)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delete sharing rule
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_sharing_rule(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/'
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.DeleteSharingRuleParam'), @module_1)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to search sharing rules
        # @param request [FiltersBody] An instance of FiltersBody
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def search_sharing_rules(request, param_instance=nil)
        if request!=nil and !request.is_a? FiltersBody
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: FiltersBody', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/search'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'ACTION'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.SearchSharingRulesParam'), @module_1)
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to deactivate sharing rule
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def deactivate_sharing_rule(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/'
        api_path = api_path + id.to_s
        api_path = api_path + '/actions/activate'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = 'ACTION'
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.DeactivateSharingRuleParam'), @module_1)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to activate sharing rule
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def activate_sharing_rule(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/'
        api_path = api_path + id.to_s
        api_path = api_path + '/actions/activate'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'ACTION'
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.ActivateSharingRuleParam'), @module_1)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get sharing rule summary
        # @return An instance of APIResponse
      # @raise SDKException
      def get_sharing_rule_summary
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/actions/summary'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.GetSharingRuleSummaryParam'), @module_1)
        require_relative 'summary_response_handler'
        handler_instance.api_call(SummaryResponseHandler.name, 'application/json')
      end

        # The method to search sharing rules summary
        # @param request [FiltersBody] An instance of FiltersBody
        # @return An instance of APIResponse
      # @raise SDKException
      def search_sharing_rules_summary(request)
        if request!=nil and !request.is_a? FiltersBody
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: FiltersBody', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/actions/summary'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'ACTION'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.SearchSharingRulesSummaryParam'), @module_1)
        require_relative 'summary_response_handler'
        handler_instance.api_call(SummaryResponseHandler.name, 'application/json')
      end

        # The method to rerun sharing rules
        # @return An instance of APIResponse
      # @raise SDKException
      def rerun_sharing_rules
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/data_sharing/rules/actions/run'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'ACTION'
        handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.SharingRules.RerunSharingRulesParam'), @module_1)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

      class GetSharingRulesParam
          @@page =   Param.new('page', 'com.zoho.crm.api.SharingRules.GetSharingRulesParam')
        def self.page
          @@page
        end
          @@per_page =   Param.new('per_page', 'com.zoho.crm.api.SharingRules.GetSharingRulesParam')
        def self.per_page
          @@per_page
        end
      end

      class CreateSharingRulesParam
      end

      class UpdateSharingRulesParam
      end

      class GetSharingRuleParam
      end

      class UpdateSharingRuleParam
      end

      class DeleteSharingRuleParam
      end

      class SearchSharingRulesParam
          @@page =   Param.new('page', 'com.zoho.crm.api.SharingRules.SearchSharingRulesParam')
        def self.page
          @@page
        end
          @@per_page =   Param.new('per_page', 'com.zoho.crm.api.SharingRules.SearchSharingRulesParam')
        def self.per_page
          @@per_page
        end
      end

      class DeactivateSharingRuleParam
      end

      class ActivateSharingRuleParam
      end

      class GetSharingRuleSummaryParam
      end

      class SearchSharingRulesSummaryParam
      end

      class RerunSharingRulesParam
      end

    end
  end
end
