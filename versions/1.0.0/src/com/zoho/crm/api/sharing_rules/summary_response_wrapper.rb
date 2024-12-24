require_relative '../util/model'

module ZOHOCRMSDK
  module SharingRules
    require_relative 'summary_response_handler'
    class SummaryResponseWrapper
      include Util::Model
      include SummaryResponseHandler

      # Creates an instance of SummaryResponseWrapper
      def initialize
        @sharing_rules_summary = nil
        @key_modified = Hash.new
      end

        # The method to get the sharing_rules_summary
        # @return An instance of Array

      def sharing_rules_summary
        @sharing_rules_summary
      end

        # The method to set the value to sharing_rules_summary
        # @param sharing_rules_summary [Array] An instance of Array

      def sharing_rules_summary=(sharing_rules_summary)
        if sharing_rules_summary!=nil and !sharing_rules_summary.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sharing_rules_summary EXPECTED TYPE: Array', nil, nil)
        end
        @sharing_rules_summary = sharing_rules_summary
        @key_modified['sharing_rules_summary'] = 1
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
