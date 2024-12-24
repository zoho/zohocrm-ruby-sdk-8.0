require_relative '../util/model'

module ZOHOCRMSDK
  module UserGroups
    class JobsWrapper
      include Util::Model

      # Creates an instance of JobsWrapper
      def initialize
        @deletion_jobs = nil
        @key_modified = Hash.new
      end

        # The method to get the deletion_jobs
        # @return An instance of Array

      def deletion_jobs
        @deletion_jobs
      end

        # The method to set the value to deletion_jobs
        # @param deletion_jobs [Array] An instance of Array

      def deletion_jobs=(deletion_jobs)
        if deletion_jobs!=nil and !deletion_jobs.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: deletion_jobs EXPECTED TYPE: Array', nil, nil)
        end
        @deletion_jobs = deletion_jobs
        @key_modified['deletion_jobs'] = 1
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