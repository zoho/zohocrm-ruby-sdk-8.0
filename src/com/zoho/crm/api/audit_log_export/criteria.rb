require_relative '../util/model'

module ZOHOCRMSDK
  module AuditLogExport
    class Criteria
      include Util::Model

      # Creates an instance of Criteria
      def initialize
        @field = nil
        @comparator = nil
        @value = nil
        @group_operator = nil
        @group = nil
        @key_modified = Hash.new
      end

        # The method to get the field
        # @return An instance of Field

      def field
        @field
      end

        # The method to set the value to field
        # @param field [Field] An instance of Field

      def field=(field)
        if field!=nil and !field.is_a? Field
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: field EXPECTED TYPE: Field', nil, nil)
        end
        @field = field
        @key_modified['field'] = 1
      end

        # The method to get the comparator
        # @return A String value

      def comparator
        @comparator
      end

        # The method to set the value to comparator
        # @param comparator [String] A String

      def comparator=(comparator)
        if comparator!=nil and !comparator.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: comparator EXPECTED TYPE: String', nil, nil)
        end
        @comparator = comparator
        @key_modified['comparator'] = 1
      end

        # The method to get the value
        # @return A lang::Object value

      def value
        @value
      end

        # The method to set the value to value
        # @param value [lang::Object] A lang::Object

      def value=(value)
        @value = value
        @key_modified['value'] = 1
      end

        # The method to get the group_operator
        # @return A String value

      def group_operator
        @group_operator
      end

        # The method to set the value to group_operator
        # @param group_operator [String] A String

      def group_operator=(group_operator)
        if group_operator!=nil and !group_operator.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: group_operator EXPECTED TYPE: String', nil, nil)
        end
        @group_operator = group_operator
        @key_modified['group_operator'] = 1
      end

        # The method to get the group
        # @return An instance of Array

      def group
        @group
      end

        # The method to set the value to group
        # @param group [Array] An instance of Array

      def group=(group)
        if group!=nil and !group.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: group EXPECTED TYPE: Array', nil, nil)
        end
        @group = group
        @key_modified['group'] = 1
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
