require_relative '../util/model'

module ZOHOCRMSDK
  module EmailConfigurationOptions
    class PropertyDetails
      include Util::Model

      # Creates an instance of PropertyDetails
      def initialize
        @name = nil
        @values = nil
        @data_type = nil
        @properties = nil
        @key_modified = Hash.new
      end

        # The method to get the name
        # @return A String value

      def name
        @name
      end

        # The method to set the value to name
        # @param name [String] A String

      def name=(name)
        if name!=nil and !name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: name EXPECTED TYPE: String', nil, nil)
        end
        @name = name
        @key_modified['name'] = 1
      end

        # The method to get the values
        # @return An instance of Array

      def values
        @values
      end

        # The method to set the value to values
        # @param values [Array] An instance of Array

      def values=(values)
        if values!=nil and !values.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: values EXPECTED TYPE: Array', nil, nil)
        end
        @values = values
        @key_modified['values'] = 1
      end

        # The method to get the data_type
        # @return A String value

      def data_type
        @data_type
      end

        # The method to set the value to data_type
        # @param data_type [String] A String

      def data_type=(data_type)
        if data_type!=nil and !data_type.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: data_type EXPECTED TYPE: String', nil, nil)
        end
        @data_type = data_type
        @key_modified['data_type'] = 1
      end

        # The method to get the properties
        # @return An instance of Array

      def properties
        @properties
      end

        # The method to set the value to properties
        # @param properties [Array] An instance of Array

      def properties=(properties)
        if properties!=nil and !properties.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: properties EXPECTED TYPE: Array', nil, nil)
        end
        @properties = properties
        @key_modified['properties'] = 1
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
