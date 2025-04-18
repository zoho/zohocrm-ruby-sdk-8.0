require_relative '../util/model'

module ZOHOCRMSDK
  module Modules
    class MinifiedModule
      include Util::Model

      # Creates an instance of MinifiedModule
      def initialize
        @api_name = nil
        @id = nil
        @module_name = nil
        @module_1 = nil
        @crypt = nil
        @key_modified = Hash.new
      end

        # The method to get the api_name
        # @return A String value

      def api_name
        @api_name
      end

        # The method to set the value to api_name
        # @param api_name [String] A String

      def api_name=(api_name)
        if api_name!=nil and !api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: api_name EXPECTED TYPE: String', nil, nil)
        end
        @api_name = api_name
        @key_modified['api_name'] = 1
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

        # The method to get the module_name
        # @return A String value

      def module_name
        @module_name
      end

        # The method to set the value to module_name
        # @param module_name [String] A String

      def module_name=(module_name)
        if module_name!=nil and !module_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_name EXPECTED TYPE: String', nil, nil)
        end
        @module_name = module_name
        @key_modified['module_name'] = 1
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

        # The method to get the crypt
        # @return A Boolean value

      def crypt
        @crypt
      end

        # The method to set the value to crypt
        # @param crypt [Boolean] A Boolean

      def crypt=(crypt)
        if crypt!=nil and ! [true, false].include?crypt
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: crypt EXPECTED TYPE: Boolean', nil, nil)
        end
        @crypt = crypt
        @key_modified['crypt'] = 1
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
