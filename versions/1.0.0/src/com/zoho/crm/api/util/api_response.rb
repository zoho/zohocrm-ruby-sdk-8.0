module ZOHOCRMSDK
  module Response
    # This class is the common API response object.
    class APIResponse
      attr_reader :headers, :status_code, :data_object, :is_expected, :response_json
      # Creates an APIResponse class instance with the specified parameters.
      # @param headers A Hash containing the API response headers.
      # @param status_code A Integer containing the API response HTTP status code.
      # @param object A Object containing the API response class instance.
      # @param is_expected boolean representing the response expected or not
      # @param response_json object representing the responseJSON object.
      def initialize(headers, status_code, object, is_expected, response_json)
        @headers = headers
        @status_code = status_code
        @data_object = object
        @is_expected = is_expected
        @response_json = response_json
      end
    end
  end
end