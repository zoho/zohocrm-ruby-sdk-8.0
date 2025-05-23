require_relative '../util/model'

module ZOHOCRMSDK
  module Layouts
    class SubformProperty
      include Util::Model

      # Creates an instance of SubformProperty
      def initialize
        @pinned_column = nil
        @key_modified = Hash.new
      end

        # The method to get the pinned_column
        # @return A Boolean value

      def pinned_column
        @pinned_column
      end

        # The method to set the value to pinned_column
        # @param pinned_column [Boolean] A Boolean

      def pinned_column=(pinned_column)
        if pinned_column!=nil and ! [true, false].include?pinned_column
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: pinned_column EXPECTED TYPE: Boolean', nil, nil)
        end
        @pinned_column = pinned_column
        @key_modified['pinned_column'] = 1
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
