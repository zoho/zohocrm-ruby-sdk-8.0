require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module GetRelatedRecordsCount
    class Params
      include Util::Model

      # Creates an instance of Params
      def initialize
        @approved = nil
        @converted = nil
        @associated = nil
        @category = nil
        @approval_state = nil
        @filters = nil
        @key_modified = Hash.new
      end

        # The method to get the approved
        # @return A Boolean value

      def approved
        @approved
      end

        # The method to set the value to approved
        # @param approved [Boolean] A Boolean

      def approved=(approved)
        if approved!=nil and ! [true, false].include?approved
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: approved EXPECTED TYPE: Boolean', nil, nil)
        end
        @approved = approved
        @key_modified['approved'] = 1
      end

        # The method to get the converted
        # @return A Boolean value

      def converted
        @converted
      end

        # The method to set the value to converted
        # @param converted [Boolean] A Boolean

      def converted=(converted)
        if converted!=nil and ! [true, false].include?converted
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: converted EXPECTED TYPE: Boolean', nil, nil)
        end
        @converted = converted
        @key_modified['converted'] = 1
      end

        # The method to get the associated
        # @return A Boolean value

      def associated
        @associated
      end

        # The method to set the value to associated
        # @param associated [Boolean] A Boolean

      def associated=(associated)
        if associated!=nil and ! [true, false].include?associated
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: associated EXPECTED TYPE: Boolean', nil, nil)
        end
        @associated = associated
        @key_modified['associated'] = 1
      end

        # The method to get the category
        # @return An instance of Util::Choice

      def category
        @category
      end

        # The method to set the value to category
        # @param category [Util::Choice] An instance of Util::Choice

      def category=(category)
        if category!=nil and !category.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: category EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @category = category
        @key_modified['category'] = 1
      end

        # The method to get the approval_state
        # @return An instance of Util::Choice

      def approval_state
        @approval_state
      end

        # The method to set the value to approval_state
        # @param approval_state [Util::Choice] An instance of Util::Choice

      def approval_state=(approval_state)
        if approval_state!=nil and !approval_state.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: approval_state EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @approval_state = approval_state
        @key_modified['approval_state'] = 1
      end

        # The method to get the filters
        # @return An instance of Filters

      def filters
        @filters
      end

        # The method to set the value to filters
        # @param filters [Filters] An instance of Filters

      def filters=(filters)
        if filters!=nil and !filters.is_a? Filters
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: filters EXPECTED TYPE: Filters', nil, nil)
        end
        @filters = filters
        @key_modified['filters'] = 1
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
