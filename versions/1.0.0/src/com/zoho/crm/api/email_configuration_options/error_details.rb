require_relative '../util/model'

module ZOHOCRMSDK
  module EmailConfigurationOptions
    class ErrorDetails
      include Util::Model

      # Creates an instance of ErrorDetails
      def initialize
        @api_name = nil
        @json_path = nil
        @range = nil
        @supported_values = nil
        @key_modified = Hash.new
      end

        # The method to get the api_name
        # @return A String value

      def api_name
        @api_name
      end

        # The method to set the value to api_name
        # @param api_name [String] A String

      def api_name=(api_name)
        if api_name!=nil and !api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: api_name EXPECTED TYPE: String', nil, nil)
        end
        @api_name = api_name
        @key_modified['api_name'] = 1
      end

        # The method to get the json_path
        # @return A String value

      def json_path
        @json_path
      end

        # The method to set the value to json_path
        # @param json_path [String] A String

      def json_path=(json_path)
        if json_path!=nil and !json_path.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: json_path EXPECTED TYPE: String', nil, nil)
        end
        @json_path = json_path
        @key_modified['json_path'] = 1
      end

        # The method to get the range
        # @return An instance of RangeStructure

      def range
        @range
      end

        # The method to set the value to range
        # @param range [RangeStructure] An instance of RangeStructure

      def range=(range)
        if range!=nil and !range.is_a? RangeStructure
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: range EXPECTED TYPE: RangeStructure', nil, nil)
        end
        @range = range
        @key_modified['range'] = 1
      end

        # The method to get the supported_values
        # @return An instance of Array

      def supported_values
        @supported_values
      end

        # The method to set the value to supported_values
        # @param supported_values [Array] An instance of Array

      def supported_values=(supported_values)
        if supported_values!=nil and !supported_values.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: supported_values EXPECTED TYPE: Array', nil, nil)
        end
        @supported_values = supported_values
        @key_modified['supported_values'] = 1
      end

        # The method to check if the user has modified the given key
        # @param key [String] A String
        # @return A Integer value

      def is_key_modified(key)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if @key_modified.key?(key)
          return @key_modified[key]
        end

        nil
      end

        # The method to mark the given key as modified
        # @param key [String] A String
        # @param modification [Integer] A Integer

      def set_key_modified(key, modification)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if modification!=nil and !modification.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: modification EXPECTED TYPE: Integer', nil, nil)
        end
        @key_modified[key] = modification
      end

    end
  end
end
