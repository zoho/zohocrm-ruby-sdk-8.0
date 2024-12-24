require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module RecycleBin
    class RecycleBinOperations

      # Creates an instance of RecycleBinOperations
      def initialize
      end

        # The method to get recyclebin records
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_recyclebin_records(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/recycle_bin'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to delete recyclebin records
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_recyclebin_records(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/recycle_bin'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.param = param_instance
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get recyclebin record
        # @param record_id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def get_recyclebin_record(record_id)
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/recycle_bin/'
        api_path = api_path + record_id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to delete recyclebin record
        # @param record_id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_recyclebin_record(record_id)
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/recycle_bin/'
        api_path = api_path + record_id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

      class GetRecycleBinRecordsParam
          @@ids =   Param.new('ids', 'com.zoho.crm.api.RecycleBin.GetRecycleBinRecordsParam')
        def self.ids
          @@ids
        end
          @@sort_by =   Param.new('sort_by', 'com.zoho.crm.api.RecycleBin.GetRecycleBinRecordsParam')
        def self.sort_by
          @@sort_by
        end
          @@sort_order =   Param.new('sort_order', 'com.zoho.crm.api.RecycleBin.GetRecycleBinRecordsParam')
        def self.sort_order
          @@sort_order
        end
          @@page =   Param.new('page', 'com.zoho.crm.api.RecycleBin.GetRecycleBinRecordsParam')
        def self.page
          @@page
        end
          @@per_page =   Param.new('per_page', 'com.zoho.crm.api.RecycleBin.GetRecycleBinRecordsParam')
        def self.per_page
          @@per_page
        end
          @@filters =   Param.new('filters', 'com.zoho.crm.api.RecycleBin.GetRecycleBinRecordsParam')
        def self.filters
          @@filters
        end
      end

      class DeleteRecycleBinRecordsParam
          @@filters =   Param.new('filters', 'com.zoho.crm.api.RecycleBin.DeleteRecycleBinRecordsParam')
        def self.filters
          @@filters
        end
          @@ids =   Param.new('ids', 'com.zoho.crm.api.RecycleBin.DeleteRecycleBinRecordsParam')
        def self.ids
          @@ids
        end
      end

    end
  end
end
