require_relative '../util/model'

module ZOHOCRMSDK
  module Attachments
    class Info
      include Util::Model

      # Creates an instance of Info
      def initialize
        @per_page = nil
        @page = nil
        @count = nil
        @more_records = nil
        @next_page_token = nil
        @page_token_expiry = nil
        @previous_page_token = nil
        @key_modified = Hash.new
      end

        # The method to get the per_page
        # @return A Integer value

      def per_page
        @per_page
      end

        # The method to set the value to per_page
        # @param per_page [Integer] A Integer

      def per_page=(per_page)
        if per_page!=nil and !per_page.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: per_page EXPECTED TYPE: Integer', nil, nil)
        end
        @per_page = per_page
        @key_modified['per_page'] = 1
      end

        # The method to get the page
        # @return A Integer value

      def page
        @page
      end

        # The method to set the value to page
        # @param page [Integer] A Integer

      def page=(page)
        if page!=nil and !page.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: page EXPECTED TYPE: Integer', nil, nil)
        end
        @page = page
        @key_modified['page'] = 1
      end

        # The method to get the count
        # @return A Integer value

      def count
        @count
      end

        # The method to set the value to count
        # @param count [Integer] A Integer

      def count=(count)
        if count!=nil and !count.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: count EXPECTED TYPE: Integer', nil, nil)
        end
        @count = count
        @key_modified['count'] = 1
      end

        # The method to get the more_records
        # @return A Boolean value

      def more_records
        @more_records
      end

        # The method to set the value to more_records
        # @param more_records [Boolean] A Boolean

      def more_records=(more_records)
        if more_records!=nil and ! [true, false].include?more_records
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: more_records EXPECTED TYPE: Boolean', nil, nil)
        end
        @more_records = more_records
        @key_modified['more_records'] = 1
      end

        # The method to get the next_page_token
        # @return A String value

      def next_page_token
        @next_page_token
      end

        # The method to set the value to next_page_token
        # @param next_page_token [String] A String

      def next_page_token=(next_page_token)
        if next_page_token!=nil and !next_page_token.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: next_page_token EXPECTED TYPE: String', nil, nil)
        end
        @next_page_token = next_page_token
        @key_modified['next_page_token'] = 1
      end

        # The method to get the page_token_expiry
        # @return An instance of DateTime

      def page_token_expiry
        @page_token_expiry
      end

        # The method to set the value to page_token_expiry
        # @param page_token_expiry [DateTime] An instance of DateTime

      def page_token_expiry=(page_token_expiry)
        if page_token_expiry!=nil and !page_token_expiry.is_a? DateTime
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: page_token_expiry EXPECTED TYPE: DateTime', nil, nil)
        end
        @page_token_expiry = page_token_expiry
        @key_modified['page_token_expiry'] = 1
      end

        # The method to get the previous_page_token
        # @return A String value

      def previous_page_token
        @previous_page_token
      end

        # The method to set the value to previous_page_token
        # @param previous_page_token [String] A String

      def previous_page_token=(previous_page_token)
        if previous_page_token!=nil and !previous_page_token.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: previous_page_token EXPECTED TYPE: String', nil, nil)
        end
        @previous_page_token = previous_page_token
        @key_modified['previous_page_token'] = 1
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
