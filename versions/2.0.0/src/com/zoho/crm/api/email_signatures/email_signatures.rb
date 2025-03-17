require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module EmailSignatures
    class EmailSignatures
      include Util::Model

      # Creates an instance of EmailSignatures
      def initialize
        @name = nil
        @from = nil
        @editor_mode = nil
        @id = nil
        @content = nil
        @key_modified = Hash.new
      end

        # The method to get the name
        # @return A String value

      def name
        @name
      end

        # The method to set the value to name
        # @param name [String] A String

      def name=(name)
        if name!=nil and !name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: name EXPECTED TYPE: String', nil, nil)
        end
        @name = name
        @key_modified['name'] = 1
      end

        # The method to get the from
        # @return An instance of Array

      def from
        @from
      end

        # The method to set the value to from
        # @param from [Array] An instance of Array

      def from=(from)
        if from!=nil and !from.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: from EXPECTED TYPE: Array', nil, nil)
        end
        @from = from
        @key_modified['from'] = 1
      end

        # The method to get the editor_mode
        # @return An instance of Util::Choice

      def editor_mode
        @editor_mode
      end

        # The method to set the value to editor_mode
        # @param editor_mode [Util::Choice] An instance of Util::Choice

      def editor_mode=(editor_mode)
        if editor_mode!=nil and !editor_mode.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: editor_mode EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @editor_mode = editor_mode
        @key_modified['editor_mode'] = 1
      end

        # The method to get the id
        # @return A Integer value

      def id
        @id
      end

        # The method to set the value to id
        # @param id [Integer] A Integer

      def id=(id)
        if id!=nil and !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        @id = id
        @key_modified['id'] = 1
      end

        # The method to get the content
        # @return A String value

      def content
        @content
      end

        # The method to set the value to content
        # @param content [String] A String

      def content=(content)
        if content!=nil and !content.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: content EXPECTED TYPE: String', nil, nil)
        end
        @content = content
        @key_modified['content'] = 1
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
