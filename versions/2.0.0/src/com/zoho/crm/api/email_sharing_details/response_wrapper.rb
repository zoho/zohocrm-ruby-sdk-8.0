require_relative '../util/model'

module ZOHOCRMSDK
  module EmailSharingDetails
    require_relative 'response_handler'
    class ResponseWrapper
      include Util::Model
      include ResponseHandler

      # Creates an instance of ResponseWrapper
      def initialize
        @emails_sharing_details = nil
        @key_modified = Hash.new
      end

        # The method to get the emails_sharing_details
        # @return An instance of Array

      def emails_sharing_details
        @emails_sharing_details
      end

        # The method to set the value to emails_sharing_details
        # @param emails_sharing_details [Array] An instance of Array

      def emails_sharing_details=(emails_sharing_details)
        if emails_sharing_details!=nil and !emails_sharing_details.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: emails_sharing_details EXPECTED TYPE: Array', nil, nil)
        end
        @emails_sharing_details = emails_sharing_details
        @key_modified['__emails_sharing_details'] = 1
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
