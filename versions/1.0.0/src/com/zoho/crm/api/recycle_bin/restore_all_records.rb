require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module RecycleBin
    class RestoreAllRecords
      include Util::Model

      # Creates an instance of RestoreAllRecords
      def initialize
        @restore_all_records = nil
        @key_modified = Hash.new
      end

        # The method to get the restore_all_records
        # @return An instance of Util::Choice

      def restore_all_records
        @restore_all_records
      end

        # The method to set the value to restore_all_records
        # @param restore_all_records [Util::Choice] An instance of Util::Choice

      def restore_all_records=(restore_all_records)
        if restore_all_records!=nil and !restore_all_records.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: restore_all_records EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @restore_all_records = restore_all_records
        @key_modified['restore_all_records'] = 1
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
