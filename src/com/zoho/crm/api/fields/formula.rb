require_relative '../util/model'

module ZOHOCRMSDK
  module Fields
    class Formula
      include Util::Model

      # Creates an instance of Formula
      def initialize
        @return_type = nil
        @assume_default = nil
        @expression = nil
        @dynamic = nil
        @stop_compute_conditionally = nil
        @stop_compute_expression = nil
        @key_modified = Hash.new
      end

        # The method to get the return_type
        # @return A String value

      def return_type
        @return_type
      end

        # The method to set the value to return_type
        # @param return_type [String] A String

      def return_type=(return_type)
        if return_type!=nil and !return_type.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: return_type EXPECTED TYPE: String', nil, nil)
        end
        @return_type = return_type
        @key_modified['return_type'] = 1
      end

        # The method to get the assume_default
        # @return A Boolean value

      def assume_default
        @assume_default
      end

        # The method to set the value to assume_default
        # @param assume_default [Boolean] A Boolean

      def assume_default=(assume_default)
        if assume_default!=nil and ! [true, false].include?assume_default
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: assume_default EXPECTED TYPE: Boolean', nil, nil)
        end
        @assume_default = assume_default
        @key_modified['assume_default'] = 1
      end

        # The method to get the expression
        # @return A String value

      def expression
        @expression
      end

        # The method to set the value to expression
        # @param expression [String] A String

      def expression=(expression)
        if expression!=nil and !expression.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: expression EXPECTED TYPE: String', nil, nil)
        end
        @expression = expression
        @key_modified['expression'] = 1
      end

        # The method to get the dynamic
        # @return A Boolean value

      def dynamic
        @dynamic
      end

        # The method to set the value to dynamic
        # @param dynamic [Boolean] A Boolean

      def dynamic=(dynamic)
        if dynamic!=nil and ! [true, false].include?dynamic
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: dynamic EXPECTED TYPE: Boolean', nil, nil)
        end
        @dynamic = dynamic
        @key_modified['dynamic'] = 1
      end

        # The method to get the stop_compute_conditionally
        # @return A Boolean value

      def stop_compute_conditionally
        @stop_compute_conditionally
      end

        # The method to set the value to stop_compute_conditionally
        # @param stop_compute_conditionally [Boolean] A Boolean

      def stop_compute_conditionally=(stop_compute_conditionally)
        if stop_compute_conditionally!=nil and ! [true, false].include?stop_compute_conditionally
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: stop_compute_conditionally EXPECTED TYPE: Boolean', nil, nil)
        end
        @stop_compute_conditionally = stop_compute_conditionally
        @key_modified['stop_compute_conditionally'] = 1
      end

        # The method to get the stop_compute_expression
        # @return A String value

      def stop_compute_expression
        @stop_compute_expression
      end

        # The method to set the value to stop_compute_expression
        # @param stop_compute_expression [String] A String

      def stop_compute_expression=(stop_compute_expression)
        if stop_compute_expression!=nil and !stop_compute_expression.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: stop_compute_expression EXPECTED TYPE: String', nil, nil)
        end
        @stop_compute_expression = stop_compute_expression
        @key_modified['stop_compute_expression'] = 1
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
