require_relative '../util/model'

module ZOHOCRMSDK
  module Layouts
    class Profiles
      include Util::Model

      # Creates an instance of Profiles
      def initialize
        @default = nil
        @name = nil
        @id = nil
        @default_view = nil
        @default_assignment_view = nil
        @key_modified = Hash.new
      end

        # The method to get the default
        # @return A Boolean value

      def default
        @default
      end

        # The method to set the value to default
        # @param default [Boolean] A Boolean

      def default=(default)
        if default!=nil and ! [true, false].include?default
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: default EXPECTED TYPE: Boolean', nil, nil)
        end
        @default = default
        @key_modified['default'] = 1
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

        # The method to get the default_view
        # @return An instance of DefaultView

      def default_view
        @default_view
      end

        # The method to set the value to default_view
        # @param default_view [DefaultView] An instance of DefaultView

      def default_view=(default_view)
        if default_view!=nil and !default_view.is_a? DefaultView
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: default_view EXPECTED TYPE: DefaultView', nil, nil)
        end
        @default_view = default_view
        @key_modified['_default_view'] = 1
      end

        # The method to get the default_assignment_view
        # @return An instance of DefaultAssignmentView

      def default_assignment_view
        @default_assignment_view
      end

        # The method to set the value to default_assignment_view
        # @param default_assignment_view [DefaultAssignmentView] An instance of DefaultAssignmentView

      def default_assignment_view=(default_assignment_view)
        if default_assignment_view!=nil and !default_assignment_view.is_a? DefaultAssignmentView
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: default_assignment_view EXPECTED TYPE: DefaultAssignmentView', nil, nil)
        end
        @default_assignment_view = default_assignment_view
        @key_modified['_default_assignment_view'] = 1
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
