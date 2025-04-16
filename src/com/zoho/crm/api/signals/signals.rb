require_relative '../util/model'

module ZOHOCRMSDK
  module Signals
    class Signals
      include Util::Model

      # Creates an instance of Signals
      def initialize
        @display_label = nil
        @namespace = nil
        @chat_enabled = nil
        @enabled = nil
        @id = nil
        @feature_availability = nil
        @extension = nil
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

        # The method to get the chat_enabled
        # @return A Boolean value

      def chat_enabled
        @chat_enabled
      end

        # The method to set the value to chat_enabled
        # @param chat_enabled [Boolean] A Boolean

      def chat_enabled=(chat_enabled)
        if chat_enabled!=nil and ! [true, false].include?chat_enabled
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: chat_enabled EXPECTED TYPE: Boolean', nil, nil)
        end
        @chat_enabled = chat_enabled
        @key_modified['chat_enabled'] = 1
      end

        # The method to get the enabled
        # @return A Boolean value

      def enabled
        @enabled
      end

        # The method to set the value to enabled
        # @param enabled [Boolean] A Boolean

      def enabled=(enabled)
        if enabled!=nil and ! [true, false].include?enabled
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: enabled EXPECTED TYPE: Boolean', nil, nil)
        end
        @enabled = enabled
        @key_modified['enabled'] = 1
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

        # The method to get the feature_availability
        # @return An instance of FeatureAvailability

      def feature_availability
        @feature_availability
      end

        # The method to set the value to feature_availability
        # @param feature_availability [FeatureAvailability] An instance of FeatureAvailability

      def feature_availability=(feature_availability)
        if feature_availability!=nil and !feature_availability.is_a? FeatureAvailability
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: feature_availability EXPECTED TYPE: FeatureAvailability', nil, nil)
        end
        @feature_availability = feature_availability
        @key_modified['feature_availability'] = 1
      end

        # The method to get the extension
        # @return An instance of Extension

      def extension
        @extension
      end

        # The method to set the value to extension
        # @param extension [Extension] An instance of Extension

      def extension=(extension)
        if extension!=nil and !extension.is_a? Extension
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: extension EXPECTED TYPE: Extension', nil, nil)
        end
        @extension = extension
        @key_modified['extension'] = 1
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
