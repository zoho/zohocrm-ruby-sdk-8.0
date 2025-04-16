require_relative '../util/model'

module ZOHOCRMSDK
  module Fields
    class LinkingDetails
      include Util::Model

      # Creates an instance of LinkingDetails
      def initialize
        @module_1 = nil
        @lookup_field = nil
        @connected_lookup_field = nil
        @key_modified = Hash.new
      end

        # The method to get the module
        # @return An instance of LinkingModule

      def module
        @module_1
      end

        # The method to set the value to module
        # @param module_1 [LinkingModule] An instance of LinkingModule

      def module=(module_1)
        if module_1!=nil and !module_1.is_a? LinkingModule
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: LinkingModule', nil, nil)
        end
        @module_1 = module_1
        @key_modified['module'] = 1
      end

        # The method to get the lookup_field
        # @return An instance of LookupField

      def lookup_field
        @lookup_field
      end

        # The method to set the value to lookup_field
        # @param lookup_field [LookupField] An instance of LookupField

      def lookup_field=(lookup_field)
        if lookup_field!=nil and !lookup_field.is_a? LookupField
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: lookup_field EXPECTED TYPE: LookupField', nil, nil)
        end
        @lookup_field = lookup_field
        @key_modified['lookup_field'] = 1
      end

        # The method to get the connected_lookup_field
        # @return An instance of LookupField

      def connected_lookup_field
        @connected_lookup_field
      end

        # The method to set the value to connected_lookup_field
        # @param connected_lookup_field [LookupField] An instance of LookupField

      def connected_lookup_field=(connected_lookup_field)
        if connected_lookup_field!=nil and !connected_lookup_field.is_a? LookupField
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: connected_lookup_field EXPECTED TYPE: LookupField', nil, nil)
        end
        @connected_lookup_field = connected_lookup_field
        @key_modified['connected_lookup_field'] = 1
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
