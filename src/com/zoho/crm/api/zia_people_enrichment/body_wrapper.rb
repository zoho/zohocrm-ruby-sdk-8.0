require_relative '../util/model'

module ZOHOCRMSDK
  module ZiaPeopleEnrichment
    class BodyWrapper
      include Util::Model

      # Creates an instance of BodyWrapper
      def initialize
        @zia_people_enrichment = nil
        @key_modified = Hash.new
      end

        # The method to get the zia_people_enrichment
        # @return An instance of Array

      def zia_people_enrichment
        @zia_people_enrichment
      end

        # The method to set the value to zia_people_enrichment
        # @param zia_people_enrichment [Array] An instance of Array

      def zia_people_enrichment=(zia_people_enrichment)
        if zia_people_enrichment!=nil and !zia_people_enrichment.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: zia_people_enrichment EXPECTED TYPE: Array', nil, nil)
        end
        @zia_people_enrichment = zia_people_enrichment
        @key_modified['__zia_people_enrichment'] = 1
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
