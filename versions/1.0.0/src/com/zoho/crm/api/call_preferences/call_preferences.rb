require_relative '../util/model'

module ZOHOCRMSDK
  module CallPreferences
    class CallPreferences
      include Util::Model

      # Creates an instance of CallPreferences
      def initialize
        @show_from_number = nil
        @show_to_number = nil
        @key_modified = Hash.new
      end

        # The method to get the show_from_number
        # @return A Boolean value

      def show_from_number
        @show_from_number
      end

        # The method to set the value to show_from_number
        # @param show_from_number [Boolean] A Boolean

      def show_from_number=(show_from_number)
        if show_from_number!=nil and ! [true, false].include?show_from_number
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: show_from_number EXPECTED TYPE: Boolean', nil, nil)
        end
        @show_from_number = show_from_number
        @key_modified['show_from_number'] = 1
      end

        # The method to get the show_to_number
        # @return A Boolean value

      def show_to_number
        @show_to_number
      end

        # The method to set the value to show_to_number
        # @param show_to_number [Boolean] A Boolean

      def show_to_number=(show_to_number)
        if show_to_number!=nil and ! [true, false].include?show_to_number
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: show_to_number EXPECTED TYPE: Boolean', nil, nil)
        end
        @show_to_number = show_to_number
        @key_modified['show_to_number'] = 1
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
