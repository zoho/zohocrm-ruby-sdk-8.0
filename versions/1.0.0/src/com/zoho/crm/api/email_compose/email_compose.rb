require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module EmailCompose
    class EmailCompose
      include Util::Model

      # Creates an instance of EmailCompose
      def initialize
        @default_from_address = nil
        @default_replyto_address = nil
        @font = nil
        @type = nil
        @key_modified = Hash.new
      end

        # The method to get the default_from_address
        # @return An instance of DefaultFromAddress

      def default_from_address
        @default_from_address
      end

        # The method to set the value to default_from_address
        # @param default_from_address [DefaultFromAddress] An instance of DefaultFromAddress

      def default_from_address=(default_from_address)
        if default_from_address!=nil and !default_from_address.is_a? DefaultFromAddress
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: default_from_address EXPECTED TYPE: DefaultFromAddress', nil, nil)
        end
        @default_from_address = default_from_address
        @key_modified['default_from_address'] = 1
      end

        # The method to get the default_replyto_address
        # @return An instance of DefaultReplytoAddress

      def default_replyto_address
        @default_replyto_address
      end

        # The method to set the value to default_replyto_address
        # @param default_replyto_address [DefaultReplytoAddress] An instance of DefaultReplytoAddress

      def default_replyto_address=(default_replyto_address)
        if default_replyto_address!=nil and !default_replyto_address.is_a? DefaultReplytoAddress
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: default_replyto_address EXPECTED TYPE: DefaultReplytoAddress', nil, nil)
        end
        @default_replyto_address = default_replyto_address
        @key_modified['default_replyto_address'] = 1
      end

        # The method to get the font
        # @return An instance of Font

      def font
        @font
      end

        # The method to set the value to font
        # @param font [Font] An instance of Font

      def font=(font)
        if font!=nil and !font.is_a? Font
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: font EXPECTED TYPE: Font', nil, nil)
        end
        @font = font
        @key_modified['font'] = 1
      end

        # The method to get the type
        # @return An instance of Util::Choice

      def type
        @type
      end

        # The method to set the value to type
        # @param type [Util::Choice] An instance of Util::Choice

      def type=(type)
        if type!=nil and !type.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: type EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @type = type
        @key_modified['type'] = 1
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
