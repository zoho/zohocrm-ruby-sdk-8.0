require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module AuditLogExport
    require_relative 'action_response'
    require_relative 'action_handler'
    require_relative 'response_handler'
    class APIException
      include ActionResponse
      include Util::Model
      include ActionHandler
      include ResponseHandler

      # Creates an instance of APIException
      def initialize
        @code = nil
        @details = nil
        @message = nil
        @status = nil
        @key_modified = Hash.new
        @x_error = nil
        @info = nil
      end

        # The method to get the code
        # @return An instance of Util::Choice

      def code
        @code
      end

        # The method to set the value to code
        # @param code [Util::Choice] An instance of Util::Choice

      def code=(code)
        if code!=nil and !code.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: code EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @code = code
        @key_modified['code'] = 1
      end

        # The method to get the details
        # @return An instance of Hash

      def details
        @details
      end

        # The method to set the value to details
        # @param details [Hash] An instance of Hash

      def details=(details)
        if details!=nil and !details.is_a? Hash
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: details EXPECTED TYPE: Hash', nil, nil)
        end
        @details = details
        @key_modified['details'] = 1
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

        # The method to get the status
        # @return An instance of Util::Choice

      def status
        @status
      end

        # The method to set the value to status
        # @param status [Util::Choice] An instance of Util::Choice

      def status=(status)
        if status!=nil and !status.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: status EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @status = status
        @key_modified['status'] = 1
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

        # The method to get the x_error
        # @return A String value

      def x_error
        @x_error
      end

        # The method to set the value to x_error
        # @param x_error [String] A String

      def x_error=(x_error)
        if x_error!=nil and !x_error.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: x_error EXPECTED TYPE: String', nil, nil)
        end
        @x_error = x_error
        @key_modified['x-error'] = 1
      end

        # The method to get the info
        # @return A String value

      def info
        @info
      end

        # The method to set the value to info
        # @param info [String] A String

      def info=(info)
        if info!=nil and !info.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: info EXPECTED TYPE: String', nil, nil)
        end
        @info = info
        @key_modified['info'] = 1
      end

    end
  end
end
