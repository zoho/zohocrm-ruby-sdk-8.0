require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module UsersTerritories
    class UsersTerritoriesOperations

        # Creates an instance of UsersTerritoriesOperations with the given parameters
        # @param user [Integer] A Integer
      def initialize(user)
        if !user.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: user EXPECTED TYPE: Integer', nil, nil)
        end
        @user = user
      end

        # The method to get territories of user
        # @return An instance of APIResponse
      # @raise SDKException
      def get_territories_of_user
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + @user.to_s
        api_path = api_path + '/territories'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to associate territories to user
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def associate_territories_to_user(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + @user.to_s
        api_path = api_path + '/territories'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to remove territories from user
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def remove_territories_from_user(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + @user.to_s
        api_path = api_path + '/territories'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.param = param_instance
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get territory of user
        # @param territory [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def get_territory_of_user(territory)
        if !territory.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: territory EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + @user.to_s
        api_path = api_path + '/territories/'
        api_path = api_path + territory.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to remove territory from user
        # @param territory [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def remove_territory_from_user(territory)
        if !territory.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: territory EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/users/'
        api_path = api_path + @user.to_s
        api_path = api_path + '/territories/'
        api_path = api_path + territory.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_DELETE
        handler_instance.category_method = Constants::REQUEST_METHOD_DELETE
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

      class RemoveTerritoriesFromUserParam
          @@ids =   Param.new('ids', 'com.zoho.crm.api.UsersTerritories.RemoveTerritoriesFromUserParam')
        def self.ids
          @@ids
        end
      end

    end
  end
end
