require_relative '../global_picklists/picklist'
require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module Fields
    class PickListValue
      include Util::Model

      # Creates an instance of PickListValue
      def initialize
        @colour_code = nil
        @actual_value = nil
        @type = nil
        @id = nil
        @sequence_number = nil
        @display_value = nil
        @reference_value = nil
        @deal_category = nil
        @probability = nil
        @forecast_category = nil
        @expected_data_type = nil
        @sys_ref_name = nil
        @forecast_type = nil
        @maps = nil
        @delete = nil
        @show_value = nil
        @global_picklist_value = nil
        @key_modified = Hash.new
      end

        # The method to get the colour_code
        # @return A String value

      def colour_code
        @colour_code
      end

        # The method to set the value to colour_code
        # @param colour_code [String] A String

      def colour_code=(colour_code)
        if colour_code!=nil and !colour_code.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: colour_code EXPECTED TYPE: String', nil, nil)
        end
        @colour_code = colour_code
        @key_modified['colour_code'] = 1
      end

        # The method to get the actual_value
        # @return A String value

      def actual_value
        @actual_value
      end

        # The method to set the value to actual_value
        # @param actual_value [String] A String

      def actual_value=(actual_value)
        if actual_value!=nil and !actual_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: actual_value EXPECTED TYPE: String', nil, nil)
        end
        @actual_value = actual_value
        @key_modified['actual_value'] = 1
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

        # The method to get the sequence_number
        # @return A Integer value

      def sequence_number
        @sequence_number
      end

        # The method to set the value to sequence_number
        # @param sequence_number [Integer] A Integer

      def sequence_number=(sequence_number)
        if sequence_number!=nil and !sequence_number.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sequence_number EXPECTED TYPE: Integer', nil, nil)
        end
        @sequence_number = sequence_number
        @key_modified['sequence_number'] = 1
      end

        # The method to get the display_value
        # @return A String value

      def display_value
        @display_value
      end

        # The method to set the value to display_value
        # @param display_value [String] A String

      def display_value=(display_value)
        if display_value!=nil and !display_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: display_value EXPECTED TYPE: String', nil, nil)
        end
        @display_value = display_value
        @key_modified['display_value'] = 1
      end

        # The method to get the reference_value
        # @return A String value

      def reference_value
        @reference_value
      end

        # The method to set the value to reference_value
        # @param reference_value [String] A String

      def reference_value=(reference_value)
        if reference_value!=nil and !reference_value.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: reference_value EXPECTED TYPE: String', nil, nil)
        end
        @reference_value = reference_value
        @key_modified['reference_value'] = 1
      end

        # The method to get the deal_category
        # @return A String value

      def deal_category
        @deal_category
      end

        # The method to set the value to deal_category
        # @param deal_category [String] A String

      def deal_category=(deal_category)
        if deal_category!=nil and !deal_category.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: deal_category EXPECTED TYPE: String', nil, nil)
        end
        @deal_category = deal_category
        @key_modified['deal_category'] = 1
      end

        # The method to get the probability
        # @return A Integer value

      def probability
        @probability
      end

        # The method to set the value to probability
        # @param probability [Integer] A Integer

      def probability=(probability)
        if probability!=nil and !probability.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: probability EXPECTED TYPE: Integer', nil, nil)
        end
        @probability = probability
        @key_modified['probability'] = 1
      end

        # The method to get the forecast_category
        # @return An instance of ForecastCategory

      def forecast_category
        @forecast_category
      end

        # The method to set the value to forecast_category
        # @param forecast_category [ForecastCategory] An instance of ForecastCategory

      def forecast_category=(forecast_category)
        if forecast_category!=nil and !forecast_category.is_a? ForecastCategory
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: forecast_category EXPECTED TYPE: ForecastCategory', nil, nil)
        end
        @forecast_category = forecast_category
        @key_modified['forecast_category'] = 1
      end

        # The method to get the expected_data_type
        # @return A String value

      def expected_data_type
        @expected_data_type
      end

        # The method to set the value to expected_data_type
        # @param expected_data_type [String] A String

      def expected_data_type=(expected_data_type)
        if expected_data_type!=nil and !expected_data_type.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: expected_data_type EXPECTED TYPE: String', nil, nil)
        end
        @expected_data_type = expected_data_type
        @key_modified['expected_data_type'] = 1
      end

        # The method to get the sys_ref_name
        # @return A String value

      def sys_ref_name
        @sys_ref_name
      end

        # The method to set the value to sys_ref_name
        # @param sys_ref_name [String] A String

      def sys_ref_name=(sys_ref_name)
        if sys_ref_name!=nil and !sys_ref_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sys_ref_name EXPECTED TYPE: String', nil, nil)
        end
        @sys_ref_name = sys_ref_name
        @key_modified['sys_ref_name'] = 1
      end

        # The method to get the forecast_type
        # @return A String value

      def forecast_type
        @forecast_type
      end

        # The method to set the value to forecast_type
        # @param forecast_type [String] A String

      def forecast_type=(forecast_type)
        if forecast_type!=nil and !forecast_type.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: forecast_type EXPECTED TYPE: String', nil, nil)
        end
        @forecast_type = forecast_type
        @key_modified['forecast_type'] = 1
      end

        # The method to get the maps
        # @return An instance of Array

      def maps
        @maps
      end

        # The method to set the value to maps
        # @param maps [Array] An instance of Array

      def maps=(maps)
        if maps!=nil and !maps.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: maps EXPECTED TYPE: Array', nil, nil)
        end
        @maps = maps
        @key_modified['maps'] = 1
      end

        # The method to get the delete
        # @return A Boolean value

      def delete
        @delete
      end

        # The method to set the value to delete
        # @param delete [Boolean] A Boolean

      def delete=(delete)
        if delete!=nil and ! [true, false].include?delete
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: delete EXPECTED TYPE: Boolean', nil, nil)
        end
        @delete = delete
        @key_modified['_delete'] = 1
      end

        # The method to get the show_value
        # @return A Boolean value

      def show_value
        @show_value
      end

        # The method to set the value to show_value
        # @param show_value [Boolean] A Boolean

      def show_value=(show_value)
        if show_value!=nil and ! [true, false].include?show_value
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: show_value EXPECTED TYPE: Boolean', nil, nil)
        end
        @show_value = show_value
        @key_modified['show_value'] = 1
      end

        # The method to get the global_picklist_value
        # @return An instance of GlobalPicklists::Picklist

      def global_picklist_value
        @global_picklist_value
      end

        # The method to set the value to global_picklist_value
        # @param global_picklist_value [GlobalPicklists::Picklist] An instance of GlobalPicklists::Picklist

      def global_picklist_value=(global_picklist_value)
        if global_picklist_value!=nil and !global_picklist_value.is_a? GlobalPicklists::Picklist
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: global_picklist_value EXPECTED TYPE: Picklist', nil, nil)
        end
        @global_picklist_value = global_picklist_value
        @key_modified['_global_picklist_value'] = 1
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
