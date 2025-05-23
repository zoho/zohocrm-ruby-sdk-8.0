require_relative '../util/model'

module ZOHOCRMSDK
  module ZiaEnrichment
    class ScrapyActionWrapper
      include Util::Model

      # Creates an instance of ScrapyActionWrapper
      def initialize
        @scrapy_feedback = nil
        @key_modified = Hash.new
      end

        # The method to get the scrapy_feedback
        # @return An instance of ScrapyActionResponse

      def scrapy_feedback
        @scrapy_feedback
      end

        # The method to set the value to scrapy_feedback
        # @param scrapy_feedback [ScrapyActionResponse] An instance of ScrapyActionResponse

      def scrapy_feedback=(scrapy_feedback)
        if scrapy_feedback!=nil and !scrapy_feedback.is_a? ScrapyActionResponse
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: scrapy_feedback EXPECTED TYPE: ScrapyActionResponse', nil, nil)
        end
        @scrapy_feedback = scrapy_feedback
        @key_modified['scrapy_feedback'] = 1
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
