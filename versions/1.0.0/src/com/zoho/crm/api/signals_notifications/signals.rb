require_relative '../util/model'

module ZOHOCRMSDK
  module SignalsNotifications
    class Signals
      include Util::Model

      # Creates an instance of Signals
      def initialize
        @signal_namespace = nil
        @email = nil
        @subject = nil
        @message = nil
        @module_1 = nil
        @id = nil
        @actions = nil
        @key_modified = Hash.new
      end

        # The method to get the signal_namespace
        # @return A String value

      def signal_namespace
        @signal_namespace
      end

        # The method to set the value to signal_namespace
        # @param signal_namespace [String] A String

      def signal_namespace=(signal_namespace)
        if signal_namespace!=nil and !signal_namespace.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: signal_namespace EXPECTED TYPE: String', nil, nil)
        end
        @signal_namespace = signal_namespace
        @key_modified['signal_namespace'] = 1
      end

        # The method to get the email
        # @return A String value

      def email
        @email
      end

        # The method to set the value to email
        # @param email [String] A String

      def email=(email)
        if email!=nil and !email.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: email EXPECTED TYPE: String', nil, nil)
        end
        @email = email
        @key_modified['email'] = 1
      end

        # The method to get the subject
        # @return A String value

      def subject
        @subject
      end

        # The method to set the value to subject
        # @param subject [String] A String

      def subject=(subject)
        if subject!=nil and !subject.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: subject EXPECTED TYPE: String', nil, nil)
        end
        @subject = subject
        @key_modified['subject'] = 1
      end

        # The method to get the message
        # @return A String value

      def message
        @message
      end

        # The method to set the value to message
        # @param message [String] A String

      def message=(message)
        if message!=nil and !message.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: message EXPECTED TYPE: String', nil, nil)
        end
        @message = message
        @key_modified['message'] = 1
      end

        # The method to get the module
        # @return A String value

      def module
        @module_1
      end

        # The method to set the value to module
        # @param module_1 [String] A String

      def module=(module_1)
        if module_1!=nil and !module_1.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: String', nil, nil)
        end
        @module_1 = module_1
        @key_modified['module'] = 1
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

        # The method to get the actions
        # @return An instance of Array

      def actions
        @actions
      end

        # The method to set the value to actions
        # @param actions [Array] An instance of Array

      def actions=(actions)
        if actions!=nil and !actions.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: actions EXPECTED TYPE: Array', nil, nil)
        end
        @actions = actions
        @key_modified['actions'] = 1
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
