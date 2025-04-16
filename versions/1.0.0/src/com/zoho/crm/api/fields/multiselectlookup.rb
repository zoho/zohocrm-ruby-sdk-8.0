require_relative '../util/model'

module ZOHOCRMSDK
  module Fields
    class Multiselectlookup
      include Util::Model

      # Creates an instance of Multiselectlookup
      def initialize
        @linking_details = nil
        @connected_details = nil
        @related_list = nil
        @record_access = nil
        @key_modified = Hash.new
      end

        # The method to get the linking_details
        # @return An instance of LinkingDetails

      def linking_details
        @linking_details
      end

        # The method to set the value to linking_details
        # @param linking_details [LinkingDetails] An instance of LinkingDetails

      def linking_details=(linking_details)
        if linking_details!=nil and !linking_details.is_a? LinkingDetails
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: linking_details EXPECTED TYPE: LinkingDetails', nil, nil)
        end
        @linking_details = linking_details
        @key_modified['linking_details'] = 1
      end

        # The method to get the connected_details
        # @return An instance of ConnectedDetails

      def connected_details
        @connected_details
      end

        # The method to set the value to connected_details
        # @param connected_details [ConnectedDetails] An instance of ConnectedDetails

      def connected_details=(connected_details)
        if connected_details!=nil and !connected_details.is_a? ConnectedDetails
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: connected_details EXPECTED TYPE: ConnectedDetails', nil, nil)
        end
        @connected_details = connected_details
        @key_modified['connected_details'] = 1
      end

        # The method to get the related_list
        # @return An instance of LookupRelatedList

      def related_list
        @related_list
      end

        # The method to set the value to related_list
        # @param related_list [LookupRelatedList] An instance of LookupRelatedList

      def related_list=(related_list)
        if related_list!=nil and !related_list.is_a? LookupRelatedList
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: related_list EXPECTED TYPE: LookupRelatedList', nil, nil)
        end
        @related_list = related_list
        @key_modified['related_list'] = 1
      end

        # The method to get the record_access
        # @return A Boolean value

      def record_access
        @record_access
      end

        # The method to set the value to record_access
        # @param record_access [Boolean] A Boolean

      def record_access=(record_access)
        if record_access!=nil and ! [true, false].include?record_access
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: record_access EXPECTED TYPE: Boolean', nil, nil)
        end
        @record_access = record_access
        @key_modified['record_access'] = 1
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
