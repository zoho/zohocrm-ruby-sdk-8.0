require_relative '../param'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module FromAddresses
    class FromAddressesOperations

        # Creates an instance of FromAddressesOperations with the given parameters
        # @param user_id [String] A String
      def initialize(user_id=nil)
        if user_id!=nil and !user_id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: user_id EXPECTED TYPE: String', nil, nil)
        end
        @user_id = user_id
      end

        # The method to get from addresses
        # @return An instance of APIResponse
      # @raise SDKException
      def get_from_addresses
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/emails/actions/from_addresses'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('user_id', 'com.zoho.crm.api.FromAddresses.GetFromAddressesParam'), @user_id)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

      class GetFromAddressesParam
      end

    end
  end
end
