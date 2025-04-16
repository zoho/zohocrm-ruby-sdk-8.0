require_relative '../util/model'

module ZOHOCRMSDK
  module SignalsNotifications
    class Action
      include Util::Model

      # Creates an instance of Action
      def initialize
        @type = nil
        @open_in = nil
        @display_name = nil
        @url = nil
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

        # The method to get the open_in
        # @return A String value

      def open_in
        @open_in
      end

        # The method to set the value to open_in
        # @param open_in [String] A String

      def open_in=(open_in)
        if open_in!=nil and !open_in.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: open_in EXPECTED TYPE: String', nil, nil)
        end
        @open_in = open_in
        @key_modified['open_in'] = 1
      end

        # The method to get the display_name
        # @return A String value

      def display_name
        @display_name
      end

        # The method to set the value to display_name
        # @param display_name [String] A String

      def display_name=(display_name)
        if display_name!=nil and !display_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: display_name EXPECTED TYPE: String', nil, nil)
        end
        @display_name = display_name
        @key_modified['display_name'] = 1
      end

        # The method to get the url
        # @return A String value

      def url
        @url
      end

        # The method to set the value to url
        # @param url [String] A String

      def url=(url)
        if url!=nil and !url.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: url EXPECTED TYPE: String', nil, nil)
        end
        @url = url
        @key_modified['url'] = 1
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
