require_relative '../util/model'

module ZOHOCRMSDK
  module DuplicateCheckPreference
    class TypeConfiguration
      include Util::Model

      # Creates an instance of TypeConfiguration
      def initialize
        @field_mappings = nil
        @mapped_module = nil
        @key_modified = Hash.new
      end

        # The method to get the field_mappings
        # @return An instance of Array

      def field_mappings
        @field_mappings
      end

        # The method to set the value to field_mappings
        # @param field_mappings [Array] An instance of Array

      def field_mappings=(field_mappings)
        if field_mappings!=nil and !field_mappings.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: field_mappings EXPECTED TYPE: Array', nil, nil)
        end
        @field_mappings = field_mappings
        @key_modified['field_mappings'] = 1
      end

        # The method to get the mapped_module
        # @return An instance of MappedModule

      def mapped_module
        @mapped_module
      end

        # The method to set the value to mapped_module
        # @param mapped_module [MappedModule] An instance of MappedModule

      def mapped_module=(mapped_module)
        if mapped_module!=nil and !mapped_module.is_a? MappedModule
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: mapped_module EXPECTED TYPE: MappedModule', nil, nil)
        end
        @mapped_module = mapped_module
        @key_modified['mapped_module'] = 1
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
