require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module ZiaEnrichment
    class ZiaEnrichmentOperations

      # Creates an instance of ZiaEnrichmentOperations
      def initialize
      end

        # The method to get zia enrichment
        # @return An instance of APIResponse
      # @raise SDKException
      def get_zia_enrichment
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v8/settings/zia/data_enrichment'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

    end
  end
end
