require_relative '../util/model'

module ZOHOCRMSDK
  module SignalsNotifications
    class BodyWrapper
      include Util::Model

      # Creates an instance of BodyWrapper
      def initialize
        @signals = nil
        @key_modified = Hash.new
      end

        # The method to get the signals
        # @return An instance of Array

      def signals
        @signals
      end

        # The method to set the value to signals
        # @param signals [Array] An instance of Array

      def signals=(signals)
        if signals!=nil and !signals.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: signals EXPECTED TYPE: Array', nil, nil)
        end
        @signals = signals
        @key_modified['signals'] = 1
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
