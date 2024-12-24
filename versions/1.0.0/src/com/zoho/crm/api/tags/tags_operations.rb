require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module Tags
    class TagsOperations

      # Creates an instance of TagsOperations
      def initialize
      end

        # The method to get tags
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_tags(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/tags'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to create tags
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def create_tags(request, param_instance=nil)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/tags'
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

        # The method to update tags
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def update_tags(request, param_instance=nil)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/tags'
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

        # The method to update tag
        # @param id [Integer] A Integer
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def update_tag(id, request, param_instance=nil)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/tags/'
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.param = param_instance
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delete tag
        # @param id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_tag(id)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/tags/'
        api_path = api_path + id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to merge tags
        # @param id [Integer] A Integer
        # @param request [MergeWrapper] An instance of MergeWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def merge_tags(id, request)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? MergeWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: MergeWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/tags/'
        api_path = api_path + id.to_s
        api_path = api_path + '/actions/merge'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to add tags
        # @param module_api_name [String] A String
        # @param record_id [Integer] A Integer
        # @param request [NewTagRequestWrapper] An instance of NewTagRequestWrapper
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def add_tags(module_api_name, record_id, request, param_instance=nil)
        if !module_api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_api_name EXPECTED TYPE: String', nil, nil)
        end
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? NewTagRequestWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: NewTagRequestWrapper', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/actions/add_tags'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.param = param_instance
        require_relative 'record_action_handler'
        handler_instance.api_call(RecordActionHandler.name, 'application/json')
      end

        # The method to remove tags
        # @param module_api_name [String] A String
        # @param record_id [Integer] A Integer
        # @param request [ExistingTagRequestWrapper] An instance of ExistingTagRequestWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def remove_tags(module_api_name, record_id, request)
        if !module_api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_api_name EXPECTED TYPE: String', nil, nil)
        end
        if !record_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_id EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? ExistingTagRequestWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: ExistingTagRequestWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + module_api_name.to_s
        api_path = api_path + '/'
        api_path = api_path + record_id.to_s
        api_path = api_path + '/actions/remove_tags'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        require_relative 'record_action_handler'
        handler_instance.api_call(RecordActionHandler.name, 'application/json')
      end

        # The method to add tags to multiple records
        # @param module_api_name [String] A String
        # @param request [NewTagRequestWrapper] An instance of NewTagRequestWrapper
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def add_tags_to_multiple_records(module_api_name, request, param_instance=nil)
        if !module_api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_api_name EXPECTED TYPE: String', nil, nil)
        end
        if request!=nil and !request.is_a? NewTagRequestWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: NewTagRequestWrapper', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + module_api_name.to_s
        api_path = api_path + '/actions/add_tags'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.param = param_instance
        require_relative 'record_action_handler'
        handler_instance.api_call(RecordActionHandler.name, 'application/json')
      end

        # The method to remove tags from multiple records
        # @param module_api_name [String] A String
        # @param request [ExistingTagRequestWrapper] An instance of ExistingTagRequestWrapper
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def remove_tags_from_multiple_records(module_api_name, request, param_instance=nil)
        if !module_api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_api_name EXPECTED TYPE: String', nil, nil)
        end
        if request!=nil and !request.is_a? ExistingTagRequestWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: ExistingTagRequestWrapper', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/'
        api_path = api_path + module_api_name.to_s
        api_path = api_path + '/actions/remove_tags'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.param = param_instance
        require_relative 'record_action_handler'
        handler_instance.api_call(RecordActionHandler.name, 'application/json')
      end

        # The method to get record count for tag
        # @param id [Integer] A Integer
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_record_count_for_tag(id, param_instance=nil)
        if !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/tags/'
        api_path = api_path + id.to_s
        api_path = api_path + '/actions/records_count'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

      class GetTagsParam
          @@module_1 =   Param.new('module', 'com.zoho.crm.api.Tags.GetTagsParam')
        def self.module_1
          @@module_1
        end
          @@my_tags =   Param.new('my_tags', 'com.zoho.crm.api.Tags.GetTagsParam')
        def self.my_tags
          @@my_tags
        end
          @@include =   Param.new('include', 'com.zoho.crm.api.Tags.GetTagsParam')
        def self.include
          @@include
        end
      end

      class CreateTagsParam
          @@module_1 =   Param.new('module', 'com.zoho.crm.api.Tags.CreateTagsParam')
        def self.module_1
          @@module_1
        end
          @@color_code =   Param.new('color_code', 'com.zoho.crm.api.Tags.CreateTagsParam')
        def self.color_code
          @@color_code
        end
      end

      class UpdateTagsParam
          @@module_1 =   Param.new('module', 'com.zoho.crm.api.Tags.UpdateTagsParam')
        def self.module_1
          @@module_1
        end
      end

      class UpdateTagParam
          @@module_1 =   Param.new('module', 'com.zoho.crm.api.Tags.UpdateTagParam')
        def self.module_1
          @@module_1
        end
      end

      class AddTagsParam
          @@over_write =   Param.new('over_write', 'com.zoho.crm.api.Tags.AddTagsParam')
        def self.over_write
          @@over_write
        end
      end

      class AddTagsToMultipleRecordsParam
          @@over_write =   Param.new('over_write', 'com.zoho.crm.api.Tags.AddTagsToMultipleRecordsParam')
        def self.over_write
          @@over_write
        end
      end

      class RemoveTagsFromMultipleRecordsParam
          @@ids =   Param.new('ids', 'com.zoho.crm.api.Tags.RemoveTagsFromMultipleRecordsParam')
        def self.ids
          @@ids
        end
      end

      class GetRecordCountForTagParam
          @@module_1 =   Param.new('module', 'com.zoho.crm.api.Tags.GetRecordCountForTagParam')
        def self.module_1
          @@module_1
        end
      end

    end
  end
end
