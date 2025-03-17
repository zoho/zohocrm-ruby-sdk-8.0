require_relative '../util/model'

module ZOHOCRMSDK
  module SharingRules
    class RulesSummary
      include Util::Model

      # Creates an instance of RulesSummary
      def initialize
        @module_1 = nil
        @rule_computation_status = nil
        @rule_count = nil
        @key_modified = Hash.new
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

        # The method to get the rule_computation_status
        # @return A Boolean value

      def rule_computation_status
        @rule_computation_status
      end

        # The method to set the value to rule_computation_status
        # @param rule_computation_status [Boolean] A Boolean

      def rule_computation_status=(rule_computation_status)
        if rule_computation_status!=nil and ! [true, false].include?rule_computation_status
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: rule_computation_status EXPECTED TYPE: Boolean', nil, nil)
        end
        @rule_computation_status = rule_computation_status
        @key_modified['rule_computation_status'] = 1
      end

        # The method to get the rule_count
        # @return A Integer value

      def rule_count
        @rule_count
      end

        # The method to set the value to rule_count
        # @param rule_count [Integer] A Integer

      def rule_count=(rule_count)
        if rule_count!=nil and !rule_count.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: rule_count EXPECTED TYPE: Integer', nil, nil)
        end
        @rule_count = rule_count
        @key_modified['rule_count'] = 1
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
