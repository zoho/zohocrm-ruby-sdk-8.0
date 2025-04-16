require_relative '../util/model'

module ZOHOCRMSDK
  module EmailCompose
    class BodyWrapper
      include Util::Model

      # Creates an instance of BodyWrapper
      def initialize
        @email_compose = nil
        @key_modified = Hash.new
      end

        # The method to get the email_compose
        # @return An instance of Array

      def email_compose
        @email_compose
      end

        # The method to set the value to email_compose
        # @param email_compose [Array] An instance of Array

      def email_compose=(email_compose)
        if email_compose!=nil and !email_compose.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: email_compose EXPECTED TYPE: Array', nil, nil)
        end
        @email_compose = email_compose
        @key_modified['email_compose'] = 1
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
