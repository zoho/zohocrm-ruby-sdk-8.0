require_relative '../header'
require_relative '../header_map'
require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/choice'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module Users
    class UsersOperations

      # Creates an instance of UsersOperations
      def initialize
      end

        # The method to get users
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @param header_instance [HeaderMap] An instance of HeaderMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_users(param_instance=nil, header_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        if header_instance!=nil and !header_instance.is_a? HeaderMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: header_instance EXPECTED TYPE: HeaderMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        handler_instance.header = header_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to create users
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def create_users(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to update users
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_users(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get user
        # @param user [Integer] A Integer
        # @param header_instance [HeaderMap] An instance of HeaderMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_user(user, header_instance=nil)
        if !user.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: user EXPECTED TYPE: Integer', nil, nil)
        end
        if header_instance!=nil and !header_instance.is_a? HeaderMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: header_instance EXPECTED TYPE: HeaderMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + user.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.header = header_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update user
        # @param user [Integer] A Integer
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_user(user, request)
        if !user.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: user EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + user.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to delete user
        # @param user [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def delete_user(user)
        if !user.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: user EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + user.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get associated groups
        # @param user [Integer] A Integer
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_associated_groups(user, param_instance=nil)
        if !user.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: user EXPECTED TYPE: Integer', nil, nil)
        end
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + user.to_s
        api_path = api_path + '/actions/associated_groups'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to users count
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def users_count(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/actions/count'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        require_relative 'count_handler'
        handler_instance.api_call(CountHandler.name, 'application/json')
      end

      class GetUsersParam
          @@type =   Param.new('type', 'com.zoho.crm.api.Users.GetUsersParam')
        def self.type
          @@type
        end
          @@page =   Param.new('page', 'com.zoho.crm.api.Users.GetUsersParam')
        def self.page
          @@page
        end
          @@per_page =   Param.new('per_page', 'com.zoho.crm.api.Users.GetUsersParam')
        def self.per_page
          @@per_page
        end
          @@ids =   Param.new('ids', 'com.zoho.crm.api.Users.GetUsersParam')
        def self.ids
          @@ids
        end
      end

      class GetUsersHeader
          @@If_modified_since =   Header.new('If-Modified-Since', 'com.zoho.crm.api.Users.GetUsersHeader')
        def self.If_modified_since
          @@If_modified_since
        end
      end

      class GetUserHeader
          @@If_modified_since =   Header.new('If-Modified-Since', 'com.zoho.crm.api.Users.GetUserHeader')
        def self.If_modified_since
          @@If_modified_since
        end
      end

      class GetAssociatedGroupsParam
          @@include =   Param.new('include', 'com.zoho.crm.api.Users.GetAssociatedGroupsParam')
        def self.include
          @@include
        end
      end

      class UsersCountParam
          @@type =   Param.new('type', 'com.zoho.crm.api.Users.UsersCountParam')
        def self.type
          @@type
        end
      end

    end
  end
end
