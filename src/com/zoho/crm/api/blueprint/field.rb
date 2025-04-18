require_relative '../fields/external'
require_relative '../fields/multi_module_lookup'
require_relative '../fields/pick_list_value'
require_relative '../fields/private'
require_relative '../fields/unique'
require_relative '../util/choice'
require_relative '../util/model'

module ZOHOCRMSDK
  module Blueprint
    class Field
      include Util::Model

      # Creates an instance of Field
      def initialize
        @external = nil
        @display_type = nil
        @filterable = nil
        @pick_list_values_sorted_lexically = nil
        @sortable = nil
        @ui_type = nil
        @private = nil
        @system_mandatory = nil
        @webhook = nil
        @json_type = nil
        @crypt = nil
        @field_label = nil
        @tooltip = nil
        @created_source = nil
        @layouts = nil
        @field_read_only = nil
        @content = nil
        @display_label = nil
        @validation_rule = nil
        @read_only = nil
        @association_details = nil
        @multi_module_lookup = nil
        @currency = nil
        @id = nil
        @custom_field = nil
        @lookup = nil
        @convert_mapping = nil
        @visible = nil
        @length = nil
        @column_name = nil
        @type = nil
        @view_type = nil
        @transition_sequence = nil
        @api_name = nil
        @unique = nil
        @history_tracking = nil
        @data_type = nil
        @formula = nil
        @decimal_place = nil
        @multiselectlookup = nil
        @pick_list_values = nil
        @auto_number = nil
        @personality_name = nil
        @mandatory = nil
        @quick_sequence_number = nil
        @profiles = nil
        @key_modified = Hash.new
      end

        # The method to get the external
        # @return An instance of Fields::External

      def external
        @external
      end

        # The method to set the value to external
        # @param external [Fields::External] An instance of Fields::External

      def external=(external)
        if external!=nil and !external.is_a? Fields::External
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: external EXPECTED TYPE: External', nil, nil)
        end
        @external = external
        @key_modified['external'] = 1
      end

        # The method to get the display_type
        # @return An instance of Util::Choice

      def display_type
        @display_type
      end

        # The method to set the value to display_type
        # @param display_type [Util::Choice] An instance of Util::Choice

      def display_type=(display_type)
        if display_type!=nil and !display_type.is_a? Util::Choice
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: display_type EXPECTED TYPE: Util::Choice', nil, nil)
        end
        @display_type = display_type
        @key_modified['display_type'] = 1
      end

        # The method to get the filterable
        # @return A Boolean value

      def filterable
        @filterable
      end

        # The method to set the value to filterable
        # @param filterable [Boolean] A Boolean

      def filterable=(filterable)
        if filterable!=nil and ! [true, false].include?filterable
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: filterable EXPECTED TYPE: Boolean', nil, nil)
        end
        @filterable = filterable
        @key_modified['filterable'] = 1
      end

        # The method to get the pick_list_values_sorted_lexically
        # @return A Boolean value

      def pick_list_values_sorted_lexically
        @pick_list_values_sorted_lexically
      end

        # The method to set the value to pick_list_values_sorted_lexically
        # @param pick_list_values_sorted_lexically [Boolean] A Boolean

      def pick_list_values_sorted_lexically=(pick_list_values_sorted_lexically)
        if pick_list_values_sorted_lexically!=nil and ! [true, false].include?pick_list_values_sorted_lexically
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: pick_list_values_sorted_lexically EXPECTED TYPE: Boolean', nil, nil)
        end
        @pick_list_values_sorted_lexically = pick_list_values_sorted_lexically
        @key_modified['pick_list_values_sorted_lexically'] = 1
      end

        # The method to get the sortable
        # @return A Boolean value

      def sortable
        @sortable
      end

        # The method to set the value to sortable
        # @param sortable [Boolean] A Boolean

      def sortable=(sortable)
        if sortable!=nil and ! [true, false].include?sortable
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sortable EXPECTED TYPE: Boolean', nil, nil)
        end
        @sortable = sortable
        @key_modified['sortable'] = 1
      end

        # The method to get the ui_type
        # @return A Integer value

      def ui_type
        @ui_type
      end

        # The method to set the value to ui_type
        # @param ui_type [Integer] A Integer

      def ui_type=(ui_type)
        if ui_type!=nil and !ui_type.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: ui_type EXPECTED TYPE: Integer', nil, nil)
        end
        @ui_type = ui_type
        @key_modified['ui_type'] = 1
      end

        # The method to get the private
        # @return An instance of Fields::Private

      def private
        @private
      end

        # The method to set the value to private
        # @param private [Fields::Private] An instance of Fields::Private

      def private=(private)
        if private!=nil and !private.is_a? Fields::Private
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: private EXPECTED TYPE: Private', nil, nil)
        end
        @private = private
        @key_modified['private'] = 1
      end

        # The method to get the system_mandatory
        # @return A Boolean value

      def system_mandatory
        @system_mandatory
      end

        # The method to set the value to system_mandatory
        # @param system_mandatory [Boolean] A Boolean

      def system_mandatory=(system_mandatory)
        if system_mandatory!=nil and ! [true, false].include?system_mandatory
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: system_mandatory EXPECTED TYPE: Boolean', nil, nil)
        end
        @system_mandatory = system_mandatory
        @key_modified['system_mandatory'] = 1
      end

        # The method to get the webhook
        # @return A Boolean value

      def webhook
        @webhook
      end

        # The method to set the value to webhook
        # @param webhook [Boolean] A Boolean

      def webhook=(webhook)
        if webhook!=nil and ! [true, false].include?webhook
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: webhook EXPECTED TYPE: Boolean', nil, nil)
        end
        @webhook = webhook
        @key_modified['webhook'] = 1
      end

        # The method to get the json_type
        # @return A String value

      def json_type
        @json_type
      end

        # The method to set the value to json_type
        # @param json_type [String] A String

      def json_type=(json_type)
        if json_type!=nil and !json_type.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: json_type EXPECTED TYPE: String', nil, nil)
        end
        @json_type = json_type
        @key_modified['json_type'] = 1
      end

        # The method to get the crypt
        # @return An instance of Crypt

      def crypt
        @crypt
      end

        # The method to set the value to crypt
        # @param crypt [Crypt] An instance of Crypt

      def crypt=(crypt)
        if crypt!=nil and !crypt.is_a? Crypt
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: crypt EXPECTED TYPE: Crypt', nil, nil)
        end
        @crypt = crypt
        @key_modified['crypt'] = 1
      end

        # The method to get the field_label
        # @return A String value

      def field_label
        @field_label
      end

        # The method to set the value to field_label
        # @param field_label [String] A String

      def field_label=(field_label)
        if field_label!=nil and !field_label.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: field_label EXPECTED TYPE: String', nil, nil)
        end
        @field_label = field_label
        @key_modified['field_label'] = 1
      end

        # The method to get the tooltip
        # @return An instance of ToolTip

      def tooltip
        @tooltip
      end

        # The method to set the value to tooltip
        # @param tooltip [ToolTip] An instance of ToolTip

      def tooltip=(tooltip)
        if tooltip!=nil and !tooltip.is_a? ToolTip
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: tooltip EXPECTED TYPE: ToolTip', nil, nil)
        end
        @tooltip = tooltip
        @key_modified['tooltip'] = 1
      end

        # The method to get the created_source
        # @return A String value

      def created_source
        @created_source
      end

        # The method to set the value to created_source
        # @param created_source [String] A String

      def created_source=(created_source)
        if created_source!=nil and !created_source.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: created_source EXPECTED TYPE: String', nil, nil)
        end
        @created_source = created_source
        @key_modified['created_source'] = 1
      end

        # The method to get the layouts
        # @return An instance of Layout

      def layouts
        @layouts
      end

        # The method to set the value to layouts
        # @param layouts [Layout] An instance of Layout

      def layouts=(layouts)
        if layouts!=nil and !layouts.is_a? Layout
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: layouts EXPECTED TYPE: Layout', nil, nil)
        end
        @layouts = layouts
        @key_modified['layouts'] = 1
      end

        # The method to get the field_read_only
        # @return A Boolean value

      def field_read_only
        @field_read_only
      end

        # The method to set the value to field_read_only
        # @param field_read_only [Boolean] A Boolean

      def field_read_only=(field_read_only)
        if field_read_only!=nil and ! [true, false].include?field_read_only
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: field_read_only EXPECTED TYPE: Boolean', nil, nil)
        end
        @field_read_only = field_read_only
        @key_modified['field_read_only'] = 1
      end

        # The method to get the content
        # @return A String value

      def content
        @content
      end

        # The method to set the value to content
        # @param content [String] A String

      def content=(content)
        if content!=nil and !content.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: content EXPECTED TYPE: String', nil, nil)
        end
        @content = content
        @key_modified['content'] = 1
      end

        # The method to get the display_label
        # @return A String value

      def display_label
        @display_label
      end

        # The method to set the value to display_label
        # @param display_label [String] A String

      def display_label=(display_label)
        if display_label!=nil and !display_label.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: display_label EXPECTED TYPE: String', nil, nil)
        end
        @display_label = display_label
        @key_modified['display_label'] = 1
      end

        # The method to get the validation_rule
        # @return A String value

      def validation_rule
        @validation_rule
      end

        # The method to set the value to validation_rule
        # @param validation_rule [String] A String

      def validation_rule=(validation_rule)
        if validation_rule!=nil and !validation_rule.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: validation_rule EXPECTED TYPE: String', nil, nil)
        end
        @validation_rule = validation_rule
        @key_modified['validation_rule'] = 1
      end

        # The method to get the read_only
        # @return A Boolean value

      def read_only
        @read_only
      end

        # The method to set the value to read_only
        # @param read_only [Boolean] A Boolean

      def read_only=(read_only)
        if read_only!=nil and ! [true, false].include?read_only
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: read_only EXPECTED TYPE: Boolean', nil, nil)
        end
        @read_only = read_only
        @key_modified['read_only'] = 1
      end

        # The method to get the association_details
        # @return An instance of AssociationDetails

      def association_details
        @association_details
      end

        # The method to set the value to association_details
        # @param association_details [AssociationDetails] An instance of AssociationDetails

      def association_details=(association_details)
        if association_details!=nil and !association_details.is_a? AssociationDetails
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: association_details EXPECTED TYPE: AssociationDetails', nil, nil)
        end
        @association_details = association_details
        @key_modified['association_details'] = 1
      end

        # The method to get the multi_module_lookup
        # @return An instance of Fields::MultiModuleLookup

      def multi_module_lookup
        @multi_module_lookup
      end

        # The method to set the value to multi_module_lookup
        # @param multi_module_lookup [Fields::MultiModuleLookup] An instance of Fields::MultiModuleLookup

      def multi_module_lookup=(multi_module_lookup)
        if multi_module_lookup!=nil and !multi_module_lookup.is_a? Fields::MultiModuleLookup
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: multi_module_lookup EXPECTED TYPE: MultiModuleLookup', nil, nil)
        end
        @multi_module_lookup = multi_module_lookup
        @key_modified['multi_module_lookup'] = 1
      end

        # The method to get the currency
        # @return An instance of Currency

      def currency
        @currency
      end

        # The method to set the value to currency
        # @param currency [Currency] An instance of Currency

      def currency=(currency)
        if currency!=nil and !currency.is_a? Currency
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: currency EXPECTED TYPE: Currency', nil, nil)
        end
        @currency = currency
        @key_modified['currency'] = 1
      end

        # The method to get the id
        # @return A String value

      def id
        @id
      end

        # The method to set the value to id
        # @param id [String] A String

      def id=(id)
        if id!=nil and !id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: String', nil, nil)
        end
        @id = id
        @key_modified['id'] = 1
      end

        # The method to get the custom_field
        # @return A Boolean value

      def custom_field
        @custom_field
      end

        # The method to set the value to custom_field
        # @param custom_field [Boolean] A Boolean

      def custom_field=(custom_field)
        if custom_field!=nil and ! [true, false].include?custom_field
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: custom_field EXPECTED TYPE: Boolean', nil, nil)
        end
        @custom_field = custom_field
        @key_modified['custom_field'] = 1
      end

        # The method to get the lookup
        # @return An instance of Module

      def lookup
        @lookup
      end

        # The method to set the value to lookup
        # @param lookup [Module] An instance of Module

      def lookup=(lookup)
        if lookup!=nil and !lookup.is_a? Module
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: lookup EXPECTED TYPE: Module', nil, nil)
        end
        @lookup = lookup
        @key_modified['lookup'] = 1
      end

        # The method to get the convert_mapping
        # @return An instance of Hash

      def convert_mapping
        @convert_mapping
      end

        # The method to set the value to convert_mapping
        # @param convert_mapping [Hash] An instance of Hash

      def convert_mapping=(convert_mapping)
        if convert_mapping!=nil and !convert_mapping.is_a? Hash
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: convert_mapping EXPECTED TYPE: Hash', nil, nil)
        end
        @convert_mapping = convert_mapping
        @key_modified['convert_mapping'] = 1
      end

        # The method to get the visible
        # @return A Boolean value

      def visible
        @visible
      end

        # The method to set the value to visible
        # @param visible [Boolean] A Boolean

      def visible=(visible)
        if visible!=nil and ! [true, false].include?visible
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: visible EXPECTED TYPE: Boolean', nil, nil)
        end
        @visible = visible
        @key_modified['visible'] = 1
      end

        # The method to get the length
        # @return A Integer value

      def length
        @length
      end

        # The method to set the value to length
        # @param length [Integer] A Integer

      def length=(length)
        if length!=nil and !length.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: length EXPECTED TYPE: Integer', nil, nil)
        end
        @length = length
        @key_modified['length'] = 1
      end

        # The method to get the column_name
        # @return A String value

      def column_name
        @column_name
      end

        # The method to set the value to column_name
        # @param column_name [String] A String

      def column_name=(column_name)
        if column_name!=nil and !column_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: column_name EXPECTED TYPE: String', nil, nil)
        end
        @column_name = column_name
        @key_modified['column_name'] = 1
      end

        # The method to get the type
        # @return A String value

      def type
        @type
      end

        # The method to set the value to type
        # @param type [String] A String

      def type=(type)
        if type!=nil and !type.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: type EXPECTED TYPE: String', nil, nil)
        end
        @type = type
        @key_modified['_type'] = 1
      end

        # The method to get the view_type
        # @return An instance of ViewType

      def view_type
        @view_type
      end

        # The method to set the value to view_type
        # @param view_type [ViewType] An instance of ViewType

      def view_type=(view_type)
        if view_type!=nil and !view_type.is_a? ViewType
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: view_type EXPECTED TYPE: ViewType', nil, nil)
        end
        @view_type = view_type
        @key_modified['view_type'] = 1
      end

        # The method to get the transition_sequence
        # @return A Integer value

      def transition_sequence
        @transition_sequence
      end

        # The method to set the value to transition_sequence
        # @param transition_sequence [Integer] A Integer

      def transition_sequence=(transition_sequence)
        if transition_sequence!=nil and !transition_sequence.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: transition_sequence EXPECTED TYPE: Integer', nil, nil)
        end
        @transition_sequence = transition_sequence
        @key_modified['transition_sequence'] = 1
      end

        # The method to get the api_name
        # @return A String value

      def api_name
        @api_name
      end

        # The method to set the value to api_name
        # @param api_name [String] A String

      def api_name=(api_name)
        if api_name!=nil and !api_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: api_name EXPECTED TYPE: String', nil, nil)
        end
        @api_name = api_name
        @key_modified['api_name'] = 1
      end

        # The method to get the unique
        # @return An instance of Fields::Unique

      def unique
        @unique
      end

        # The method to set the value to unique
        # @param unique [Fields::Unique] An instance of Fields::Unique

      def unique=(unique)
        if unique!=nil and !unique.is_a? Fields::Unique
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: unique EXPECTED TYPE: Unique', nil, nil)
        end
        @unique = unique
        @key_modified['unique'] = 1
      end

        # The method to get the history_tracking
        # @return A Boolean value

      def history_tracking
        @history_tracking
      end

        # The method to set the value to history_tracking
        # @param history_tracking [Boolean] A Boolean

      def history_tracking=(history_tracking)
        if history_tracking!=nil and ! [true, false].include?history_tracking
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: history_tracking EXPECTED TYPE: Boolean', nil, nil)
        end
        @history_tracking = history_tracking
        @key_modified['history_tracking'] = 1
      end

        # The method to get the data_type
        # @return A String value

      def data_type
        @data_type
      end

        # The method to set the value to data_type
        # @param data_type [String] A String

      def data_type=(data_type)
        if data_type!=nil and !data_type.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: data_type EXPECTED TYPE: String', nil, nil)
        end
        @data_type = data_type
        @key_modified['data_type'] = 1
      end

        # The method to get the formula
        # @return An instance of Formula

      def formula
        @formula
      end

        # The method to set the value to formula
        # @param formula [Formula] An instance of Formula

      def formula=(formula)
        if formula!=nil and !formula.is_a? Formula
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: formula EXPECTED TYPE: Formula', nil, nil)
        end
        @formula = formula
        @key_modified['formula'] = 1
      end

        # The method to get the decimal_place
        # @return A String value

      def decimal_place
        @decimal_place
      end

        # The method to set the value to decimal_place
        # @param decimal_place [String] A String

      def decimal_place=(decimal_place)
        if decimal_place!=nil and !decimal_place.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: decimal_place EXPECTED TYPE: String', nil, nil)
        end
        @decimal_place = decimal_place
        @key_modified['decimal_place'] = 1
      end

        # The method to get the multiselectlookup
        # @return An instance of MultiSelectLookup

      def multiselectlookup
        @multiselectlookup
      end

        # The method to set the value to multiselectlookup
        # @param multiselectlookup [MultiSelectLookup] An instance of MultiSelectLookup

      def multiselectlookup=(multiselectlookup)
        if multiselectlookup!=nil and !multiselectlookup.is_a? MultiSelectLookup
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: multiselectlookup EXPECTED TYPE: MultiSelectLookup', nil, nil)
        end
        @multiselectlookup = multiselectlookup
        @key_modified['multiselectlookup'] = 1
      end

        # The method to get the pick_list_values
        # @return An instance of Array

      def pick_list_values
        @pick_list_values
      end

        # The method to set the value to pick_list_values
        # @param pick_list_values [Array] An instance of Array

      def pick_list_values=(pick_list_values)
        if pick_list_values!=nil and !pick_list_values.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: pick_list_values EXPECTED TYPE: Array', nil, nil)
        end
        @pick_list_values = pick_list_values
        @key_modified['pick_list_values'] = 1
      end

        # The method to get the auto_number
        # @return An instance of AutoNumber

      def auto_number
        @auto_number
      end

        # The method to set the value to auto_number
        # @param auto_number [AutoNumber] An instance of AutoNumber

      def auto_number=(auto_number)
        if auto_number!=nil and !auto_number.is_a? AutoNumber
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: auto_number EXPECTED TYPE: AutoNumber', nil, nil)
        end
        @auto_number = auto_number
        @key_modified['auto_number'] = 1
      end

        # The method to get the personality_name
        # @return A String value

      def personality_name
        @personality_name
      end

        # The method to set the value to personality_name
        # @param personality_name [String] A String

      def personality_name=(personality_name)
        if personality_name!=nil and !personality_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: personality_name EXPECTED TYPE: String', nil, nil)
        end
        @personality_name = personality_name
        @key_modified['personality_name'] = 1
      end

        # The method to get the mandatory
        # @return A Boolean value

      def mandatory
        @mandatory
      end

        # The method to set the value to mandatory
        # @param mandatory [Boolean] A Boolean

      def mandatory=(mandatory)
        if mandatory!=nil and ! [true, false].include?mandatory
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: mandatory EXPECTED TYPE: Boolean', nil, nil)
        end
        @mandatory = mandatory
        @key_modified['mandatory'] = 1
      end

        # The method to get the quick_sequence_number
        # @return A Integer value

      def quick_sequence_number
        @quick_sequence_number
      end

        # The method to set the value to quick_sequence_number
        # @param quick_sequence_number [Integer] A Integer

      def quick_sequence_number=(quick_sequence_number)
        if quick_sequence_number!=nil and !quick_sequence_number.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: quick_sequence_number EXPECTED TYPE: Integer', nil, nil)
        end
        @quick_sequence_number = quick_sequence_number
        @key_modified['quick_sequence_number'] = 1
      end

        # The method to get the profiles
        # @return An instance of Array

      def profiles
        @profiles
      end

        # The method to set the value to profiles
        # @param profiles [Array] An instance of Array

      def profiles=(profiles)
        if profiles!=nil and !profiles.is_a? Array
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: profiles EXPECTED TYPE: Array', nil, nil)
        end
        @profiles = profiles
        @key_modified['profiles'] = 1
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
