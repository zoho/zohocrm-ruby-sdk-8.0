require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module SharingRules
    class SharingRules
      include Util::Model

      # Creates an instance of SharingRules
      def initialize
        @id = nil
        @permission_type = nil
        @superiors_allowed = nil
        @name = nil
        @type = nil
        @shared_from = nil
        @shared_to = nil
        @criteria = nil
        @module_1 = nil
        @status = nil
        @match_limit_exceeded = nil
        @key_modified = Hash.new
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

        # The method to get the permission_type
        # @return An instance of Util::Choice

      def permission_type
        @permission_type
      end

        # The method to set the value to permission_type
        # @param permission_type [Util::Choice] An instance of Util::Choice

      def permission_type=(permission_type)
        if permission_type!=nil and !permission_type.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: permission_type EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @permission_type = permission_type
        @key_modified['permission_type'] = 1
      end

        # The method to get the superiors_allowed
        # @return A Boolean value

      def superiors_allowed
        @superiors_allowed
      end

        # The method to set the value to superiors_allowed
        # @param superiors_allowed [Boolean] A Boolean

      def superiors_allowed=(superiors_allowed)
        if superiors_allowed!=nil and ! [true, false].include?superiors_allowed
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: superiors_allowed EXPECTED TYPE: Boolean', nil, nil)
        end
        @superiors_allowed = superiors_allowed
        @key_modified['superiors_allowed'] = 1
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

        # The method to get the type
        # @return An instance of Util::Choice

      def type
        @type
      end

        # The method to set the value to type
        # @param type [Util::Choice] An instance of Util::Choice

      def type=(type)
        if type!=nil and !type.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: type EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @type = type
        @key_modified['type'] = 1
      end

        # The method to get the shared_from
        # @return An instance of Shared

      def shared_from
        @shared_from
      end

        # The method to set the value to shared_from
        # @param shared_from [Shared] An instance of Shared

      def shared_from=(shared_from)
        if shared_from!=nil and !shared_from.is_a? Shared
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: shared_from EXPECTED TYPE: Shared', nil, nil)
        end
        @shared_from = shared_from
        @key_modified['shared_from'] = 1
      end

        # The method to get the shared_to
        # @return An instance of Shared

      def shared_to
        @shared_to
      end

        # The method to set the value to shared_to
        # @param shared_to [Shared] An instance of Shared

      def shared_to=(shared_to)
        if shared_to!=nil and !shared_to.is_a? Shared
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: shared_to EXPECTED TYPE: Shared', nil, nil)
        end
        @shared_to = shared_to
        @key_modified['shared_to'] = 1
      end

        # The method to get the criteria
        # @return An instance of Criteria

      def criteria
        @criteria
      end

        # The method to set the value to criteria
        # @param criteria [Criteria] An instance of Criteria

      def criteria=(criteria)
        if criteria!=nil and !criteria.is_a? Criteria
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: criteria EXPECTED TYPE: Criteria', nil, nil)
        end
        @criteria = criteria
        @key_modified['criteria'] = 1
      end

        # The method to get the module
        # @return An instance of Module

      def module
        @module_1
      end

        # The method to set the value to module
        # @param module_1 [Module] An instance of Module

      def module=(module_1)
        if module_1!=nil and !module_1.is_a? Module
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: Module', nil, nil)
        end
        @module_1 = module_1
        @key_modified['module'] = 1
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

        # The method to get the match_limit_exceeded
        # @return A Boolean value

      def match_limit_exceeded
        @match_limit_exceeded
      end

        # The method to set the value to match_limit_exceeded
        # @param match_limit_exceeded [Boolean] A Boolean

      def match_limit_exceeded=(match_limit_exceeded)
        if match_limit_exceeded!=nil and ! [true, false].include?match_limit_exceeded
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: match_limit_exceeded EXPECTED TYPE: Boolean', nil, nil)
        end
        @match_limit_exceeded = match_limit_exceeded
        @key_modified['match_limit_exceeded'] = 1
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
