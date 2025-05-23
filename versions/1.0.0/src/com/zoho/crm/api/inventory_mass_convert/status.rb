require_relative '../util/model'

module ZOHOCRMSDK
  module InventoryMassConvert
    require_relative 'response_handler'
    class Status
      include Util::Model
      include ResponseHandler

      # Creates an instance of Status
      def initialize
        @total_count = nil
        @converted_count = nil
        @not_converted_count = nil
        @failed_count = nil
        @status = nil
        @key_modified = Hash.new
      end

        # The method to get the total_count
        # @return A Integer value

      def total_count
        @total_count
      end

        # The method to set the value to total_count
        # @param total_count [Integer] A Integer

      def total_count=(total_count)
        if total_count!=nil and !total_count.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: total_count EXPECTED TYPE: Integer', nil, nil)
        end
        @total_count = total_count
        @key_modified['total_count'] = 1
      end

        # The method to get the converted_count
        # @return A Integer value

      def converted_count
        @converted_count
      end

        # The method to set the value to converted_count
        # @param converted_count [Integer] A Integer

      def converted_count=(converted_count)
        if converted_count!=nil and !converted_count.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: converted_count EXPECTED TYPE: Integer', nil, nil)
        end
        @converted_count = converted_count
        @key_modified['converted_count'] = 1
      end

        # The method to get the not_converted_count
        # @return A Integer value

      def not_converted_count
        @not_converted_count
      end

        # The method to set the value to not_converted_count
        # @param not_converted_count [Integer] A Integer

      def not_converted_count=(not_converted_count)
        if not_converted_count!=nil and !not_converted_count.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: not_converted_count EXPECTED TYPE: Integer', nil, nil)
        end
        @not_converted_count = not_converted_count
        @key_modified['not_converted_count'] = 1
      end

        # The method to get the failed_count
        # @return A Integer value

      def failed_count
        @failed_count
      end

        # The method to set the value to failed_count
        # @param failed_count [Integer] A Integer

      def failed_count=(failed_count)
        if failed_count!=nil and !failed_count.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: failed_count EXPECTED TYPE: Integer', nil, nil)
        end
        @failed_count = failed_count
        @key_modified['failed_count'] = 1
      end

        # The method to get the status
        # @return A String value

      def status
        @status
      end

        # The method to set the value to status
        # @param status [String] A String

      def status=(status)
        if status!=nil and !status.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: status EXPECTED TYPE: String', nil, nil)
        end
        @status = status
        @key_modified['status'] = 1
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
