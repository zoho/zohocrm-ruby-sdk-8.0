require_relative '../util/model'

module ZOHOCRMSDK
  module EmailConfigurationOptions
    class ValueDetails
      include Util::Model

      # Creates an instance of ValueDetails
      def initialize
        @type = nil
        @value = nil
        @delete = nil
        @key_modified = Hash.new
      end

        # The method to get the type
        # @return A String value

      def type
        @type
      end

        # The method to set the value to type
        # @param type [String] A String

      def type=(type)
        if type!=nil and !type.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: type EXPECTED TYPE: String', nil, nil)
        end
        @type = type
        @key_modified['type'] = 1
      end

        # The method to get the value
        # @return A lang::Object value

      def value
        @value
      end

        # The method to set the value to value
        # @param value [lang::Object] A lang::Object

      def value=(value)
        @value = value
        @key_modified['value'] = 1
      end

        # The method to get the delete
        # @return A Boolean value

      def delete
        @delete
      end

        # The method to set the value to delete
        # @param delete [Boolean] A Boolean

      def delete=(delete)
        if delete!=nil and ! [true, false].include?delete
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: delete EXPECTED TYPE: Boolean', nil, nil)
        end
        @delete = delete
        @key_modified['_delete'] = 1
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
