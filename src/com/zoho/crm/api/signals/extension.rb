require_relative '../util/model'

module ZOHOCRMSDK
  module Signals
    class Extension
      include Util::Model

      # Creates an instance of Extension
      def initialize
        @display_label = nil
        @namespace = nil
        @id = nil
        @type = nil
        @key_modified = Hash.new
      end

        # The method to get the display_label
        # @return A String value

      def display_label
        @display_label
      end

        # The method to set the value to display_label
        # @param display_label [String] A String

      def display_label=(display_label)
        if display_label!=nil and !display_label.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: display_label EXPECTED TYPE: String', nil, nil)
        end
        @display_label = display_label
        @key_modified['display_label'] = 1
      end

        # The method to get the namespace
        # @return A String value

      def namespace
        @namespace
      end

        # The method to set the value to namespace
        # @param namespace [String] A String

      def namespace=(namespace)
        if namespace!=nil and !namespace.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: namespace EXPECTED TYPE: String', nil, nil)
        end
        @namespace = namespace
        @key_modified['namespace'] = 1
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

        # The method to get the type
        # @return A Integer value

      def type
        @type
      end

        # The method to set the value to type
        # @param type [Integer] A Integer

      def type=(type)
        if type!=nil and !type.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: type EXPECTED TYPE: Integer', nil, nil)
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
