require_relative '../util/model'

module ZOHOCRMSDK
  module BusinessHours
    require_relative 'response_handler'
    class ResponseWrapper
      include Util::Model
      include ResponseHandler

      # Creates an instance of ResponseWrapper
      def initialize
        @business_hours = nil
        @key_modified = Hash.new
      end

        # The method to get the business_hours
        # @return An instance of BusinessHours

      def business_hours
        @business_hours
      end

        # The method to set the value to business_hours
        # @param business_hours [BusinessHours] An instance of BusinessHours

      def business_hours=(business_hours)
        if business_hours!=nil and !business_hours.is_a? BusinessHours
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: business_hours EXPECTED TYPE: BusinessHours', nil, nil)
        end
        @business_hours = business_hours
        @key_modified['business_hours'] = 1
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
