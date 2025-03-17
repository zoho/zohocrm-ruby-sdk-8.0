require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module DataSharing
    class DataSharing
      include Util::Model

      # Creates an instance of DataSharing
      def initialize
        @share_type = nil
        @public_in_portals = nil
        @module_1 = nil
        @rule_computation_running = nil
        @key_modified = Hash.new
      end

        # The method to get the share_type
        # @return An instance of Util::Choice

      def share_type
        @share_type
      end

        # The method to set the value to share_type
        # @param share_type [Util::Choice] An instance of Util::Choice

      def share_type=(share_type)
        if share_type!=nil and !share_type.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: share_type EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @share_type = share_type
        @key_modified['share_type'] = 1
      end

        # The method to get the public_in_portals
        # @return A Boolean value

      def public_in_portals
        @public_in_portals
      end

        # The method to set the value to public_in_portals
        # @param public_in_portals [Boolean] A Boolean

      def public_in_portals=(public_in_portals)
        if public_in_portals!=nil and ! [true, false].include?public_in_portals
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: public_in_portals EXPECTED TYPE: Boolean', nil, nil)
        end
        @public_in_portals = public_in_portals
        @key_modified['public_in_portals'] = 1
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

        # The method to get the rule_computation_running
        # @return A Boolean value

      def rule_computation_running
        @rule_computation_running
      end

        # The method to set the value to rule_computation_running
        # @param rule_computation_running [Boolean] A Boolean

      def rule_computation_running=(rule_computation_running)
        if rule_computation_running!=nil and ! [true, false].include?rule_computation_running
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: rule_computation_running EXPECTED TYPE: Boolean', nil, nil)
        end
        @rule_computation_running = rule_computation_running
        @key_modified['rule_computation_running'] = 1
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
