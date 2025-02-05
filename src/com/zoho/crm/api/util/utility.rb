require 'json'
require 'monitor'

require_relative '../related_lists/related_list'
require_relative '../fields/fields'
require_relative '../fields/body_wrapper'
require_relative '../fields/api_exception'
require_relative '../modules/modules'
require_relative 'constants'
require_relative '../exception/sdk_exception'
require_relative '../../../api/logger/sdk_logger'

module ZOHOCRMSDK
  module Util
    # This class handles module field details.
    class Utility
      @@sync_lock = Monitor.new

      @@apitype_vs_datatype = {}

      @@apitype_vs_structurename = {}

      @@new_file = false

      @@get_modified_modules = false

      @@api_supported_module = {}

      @@module_api_name = nil

      @@force_refresh = false
      def self.set_handler_api_path(module_api_name, handler_instance)
        if handler_instance.nil?
          return 
        end
        api_path = handler_instance.api_path
        if api_path.downcase.include? module_api_name.downcase
          api_path_splits = api_path.split('/')
          i = 0
          api_path_splits.each do |api_path_split|
            split_lower = api_path_split.downcase
            if split_lower == module_api_name.downcase
              api_path_splits[i] = module_api_name
            elsif (Constants::DEFAULT_MODULENAME_VS_APINAME.key? split_lower) && (!Constants::DEFAULT_MODULENAME_VS_APINAME[split_lower].nil?)
              api_path_splits[i] = Constants::DEFAULT_MODULENAME_VS_APINAME[split_lower]
            end
            api_path = api_path_splits.join("/")
            handler_instance.api_path = api_path
            i += 1
          end
        end
      end

      def self.file_exists_flow(module_api_name, record_field_details_path, last_modified_time)
        @@sync_lock.synchronize do
          initializer = Initializer.get_initializer
          record_field_details_json = JSON.parse(File.read(record_field_details_path))
          last_modified_time_exists = false
          if record_field_details_json.key?(Constants::FIELDS_LAST_MODIFIED_TIME) && !record_field_details_json[Constants::FIELDS_LAST_MODIFIED_TIME].nil?
            if get_current_time_in_millis - record_field_details_json[Constants::FIELDS_LAST_MODIFIED_TIME] > 3_600_000
              last_modified_time_exists = true
            end
          end
          if !record_field_details_json.key?(Constants::FIELDS_LAST_MODIFIED_TIME) || @@force_refresh
            last_modified_time_exists = true
          end
          
          if initializer.sdk_config.auto_refresh_fields && !@@new_file && !@@get_modified_modules && last_modified_time_exists
            @@get_modified_modules = true
            last_modified_time = (record_field_details_json.key? Constants::FIELDS_LAST_MODIFIED_TIME) ? record_field_details_json[Constants::FIELDS_LAST_MODIFIED_TIME] : nil
            modify_fields(record_field_details_path, last_modified_time)
            @@get_modified_modules = false
          elsif !initializer.sdk_config.auto_refresh_fields && @@force_refresh && !@@get_modified_modules
            @@get_modified_modules = true
            modify_fields(record_field_details_path, last_modified_time)
            @@get_modified_modules = false
          end

          record_field_details_json = JSON.parse(File.read(record_field_details_path))
          
          return if module_api_name.nil? || (record_field_details_json.key?(module_api_name.downcase) && !record_field_details_json[module_api_name.downcase].nil?)

          fill_data_type

          record_field_details_json[module_api_name.downcase] = {}

          File.open(record_field_details_path, 'w') do |f|
            f.write(record_field_details_json.to_json)
          end
          field_details = get_fields_details(module_api_name)
          record_field_details_json = JSON.parse(File.read(record_field_details_path))

          record_field_details_json[module_api_name.downcase] = field_details

          File.open(record_field_details_path, 'w') do |f|
            f.write(record_field_details_json.to_json)
          end
        end
      end

      def self.get_fields(module_api_name, handler_instance=nil)
        @@sync_lock.synchronize do
          if module_api_name.include? ','
            split_names = module_api_name.split(',')
            split_names.each do |name|
              @@module_api_name = name
              get_fields_info(name, handler_instance)
            end
          else
            @@module_api_name = module_api_name
            get_fields_info(module_api_name,handler_instance)
          end
        end
      end

      def self.write_to_file(file_path, file_contents)
        File.open(file_path, 'w') do |f|
          f.write(file_contents.to_json)
        end
      end

      def self.get_fields_info(module_api_name, handler_instance=nil)
        require_relative '../initializer'
        initializer = Initializer.get_initializer
        record_field_details_path = nil
        last_modified_time = nil

        @@sync_lock.synchronize do
          begin
            # return if !module_api_name.nil? && !search_json_details(module_api_name).nil?

            resoures_folder_path = initializer.resources_path + '/' + Constants::RESOURCES

            Dir.mkdir resoures_folder_path unless File.exist? resoures_folder_path
            record_field_details_path = get_record_json_file_path
            unless module_api_name.nil?
              module_api_name = verify_module_api_name(module_api_name)
              set_handler_api_path(module_api_name, handler_instance)

              return if !handler_instance.nil? && handler_instance.module_api_name.nil? && (!Constants::SKIP_MODULES.include? module_api_name.downcase)
            end
            if File.exist? record_field_details_path
              file_exists_flow(module_api_name, record_field_details_path, last_modified_time)
            elsif initializer.sdk_config.auto_refresh_fields
              @@new_file = true
              fill_data_type
              @@api_supported_module = @@api_supported_module.length == 0 ? get_modules(nil) : @@api_supported_module

              record_field_details_json = {}

              if File.exists? record_field_details_path
                record_field_details_json = JSON.parse(File.read(record_field_details_path))
              end

              record_field_details_json[Constants::FIELDS_LAST_MODIFIED_TIME] = get_current_time_in_millis

              if @@api_supported_module.length > 0
                @@api_supported_module.each_key do |module_name|
                  unless record_field_details_json.key? module_name.downcase
                    record_field_details_json[module_name.downcase] = {}
                    write_to_file(record_field_details_path, record_field_details_json)
                    field_details = get_fields_details( @@api_supported_module[module_name][Constants::API_NAME])
                    record_field_details_json = JSON.parse(File.read(record_field_details_path))
                    record_field_details_json[module_name.downcase] = field_details
                    write_to_file(record_field_details_path, record_field_details_json)
                  end
                end
              end
              @@new_file = false
            elsif @@force_refresh && !@@get_modified_modules
              @@get_modified_modules = true
              record_field_details_json = {}
              write_to_file(record_field_details_path, record_field_details_json)
              modify_fields(record_field_details_path, last_modified_time)
              @@get_modified_modules = false
            else
              fill_data_type

              record_field_details_json = { module_api_name.downcase => {} }
              write_to_file(record_field_details_path, record_field_details_json)
              field_details = get_fields_details(module_api_name)
              record_field_details_json = JSON.parse(File.read(record_field_details_path))
              record_field_details_json[module_api_name.downcase] = field_details
              write_to_file(record_field_details_path, record_field_details_json)
            end
          rescue StandardError => e
            if !record_field_details_path.nil? && File.exist?(record_field_details_path)
              begin
                record_field_details_json = JSON.parse(File.read(record_field_details_path))
                if !module_api_name.nil? && record_field_details_json.key?(module_api_name.downcase)
                  record_field_details_json.delete(module_api_name.downcase)
                end
                if @@new_file
                  unless record_field_details_json[Constants::FIELDS_LAST_MODIFIED_TIME].nil?
                    record_field_details_json.delete(Constants::FIELDS_LAST_MODIFIED_TIME)
                  end
                  @@new_file = false
                end
                if @@get_modified_modules || @@force_refresh
                  @@get_modified_modules = false
                  @@force_refresh = false
                  unless last_modified_time.nil?
                    record_field_details_json[Constants::FIELDS_LAST_MODIFIED_TIME] = last_modified_time
                  end
                end
                write_to_file(record_field_details_path, record_field_details_json)
              rescue StandardError => e
                exception = SDKException.new(nil, Constants::EXCEPTION, nil, e)
                SDKLog::SDKLogger.severe(Constants::EXCEPTION, exception)
                raise exception
              end
            end
            ex = (e.class.to_s == 'SDKException') ? e : SDKException.new(nil, Constants::EXCEPTION, nil, e)
            SDKLog::SDKLogger.severe(Constants::EXCEPTION, ex)
            raise ex
          end
        end
      end

      def self.modify_fields(record_field_details_path, modified_time)
        modified_modules = get_modules(modified_time)
        record_field_details_json = JSON.parse(File.open(record_field_details_path).read)
        record_field_details_json[Constants::FIELDS_LAST_MODIFIED_TIME] = get_current_time_in_millis
        write_to_file(record_field_details_path, record_field_details_json)
        return unless modified_modules.any?

        modified_modules.each_key do |module_api_name|
          if record_field_details_json.key? module_api_name.downcase
            delete_fields(record_field_details_json, module_api_name)
          end
        end

        write_to_file(record_field_details_path, record_field_details_json)

        modified_modules.each_key do |module_api_name|
          module_data = modified_modules[module_api_name]
          get_fields_info(module_data[Constants::API_NAME])
        end
      end

      def self.verify_module_api_name(module_api_name)
        unless module_api_name.nil?
          if (Constants::DEFAULT_MODULENAME_VS_APINAME.key? module_api_name.downcase) && (!Constants::DEFAULT_MODULENAME_VS_APINAME[module_api_name.downcase].nil?)
            return Constants::DEFAULT_MODULENAME_VS_APINAME[module_api_name.downcase]
          end
        end

        record_field_details_path = get_record_json_file_path

        if File.exist? record_field_details_path
          fields_json =  JSON.parse(File.open(record_field_details_path).read)
          if !fields_json.empty? && (fields_json.key? Constants::SDK_MODULE_METADATA) && (!module_api_name.nil? && (fields_json[Constants::SDK_MODULE_METADATA].key? module_api_name.downcase))
            return fields_json[Constants::SDK_MODULE_METADATA][module_api_name.downcase][Constants::API_NAME]
          end
        end
        return module_api_name
      end

      def self.delete_fields(record_field_details_json, module_api_name)
        subform_modules = []

        field_json = record_field_details_json[module_api_name.downcase]
        field_json.each_key do |key|
          if field_json[key].key?(Constants::SUBFORM) && field_json[key][Constants::SUBFORM] 
            if record_field_details_json.key? field_json[key][Constants::MODULE]
              subform_modules.push(field_json[key][Constants::MODULE])
            end
          end
        end
        record_field_details_json.delete(module_api_name.downcase)
        return unless subform_modules.any?

        subform_modules.each do |subform_module|
          delete_fields(record_field_details_json, subform_module)
        end
      end

      def self.get_record_json_file_path()
        Initializer.get_initializer.resources_path + "/" + Constants::FIELD_DETAILS_DIRECTORY + "/" + Converter.new(nil).get_record_json_file_path()
      end

      def self.get_related_lists(related_module_name, module_api_name, common_api_handler)
        require_relative '../initializer'

        initializer = Initializer.get_initializer

        @@sync_lock.synchronize do
          begin
            is_new_data = false
            key = module_api_name + Constants::UNDERSCORE + Constants::RELATED_LISTS
            key = key.downcase
            resoures_folder_path = initializer.resources_path + '/' + Constants::RESOURCES
            Dir.mkdir resoures_folder_path unless File.exist? resoures_folder_path

            record_field_details_path = get_record_json_file_path
            if !File.exist?(record_field_details_path) || (File.exist?(record_field_details_path) && !(JSON.parse(File.read(record_field_details_path)).key? key))
              is_new_data = true
              module_api_name = verify_module_api_name(module_api_name)
              related_list_values = get_related_list_details(module_api_name)
              if  File.exist?(record_field_details_path)
                record_field_details_json = JSON.parse(File.read(record_field_details_path))
              else
                record_field_details_json = {}
              end
              record_field_details_json[key] = related_list_values
              write_to_file(record_field_details_path, record_field_details_json)
            end
            record_field_details_json = JSON.parse(File.read(record_field_details_path))
            module_related_list = record_field_details_json[key]
            if !check_related_list_exists(related_module_name, module_related_list, common_api_handler) && !is_new_data
              record_field_details_json.delete(key)
              write_to_file(record_field_details_path, record_field_details_json)
              get_related_lists(related_module_name, module_api_name, common_api_handler)
            end
          rescue SDKException => e
            SDKLog::SDKLogger.severe(Constants::EXCEPTION, e)
            raise e
          rescue StandardError => e
            ex = SDKException.new(nil, Constants::EXCEPTION, nil, e)
            SDKLog::SDKLogger.severe(Constants::EXCEPTION, ex)
            raise ex
          end
        end
      end

      def self.get_fields_details(module_api_name)
        require_relative '../fields/fields_operations'
        fields_details = {}
        param_instance = ParameterMap.new
        param_instance.add(Fields::FieldsOperations::GetFieldsParam.module_1, module_api_name)
        response = Fields::FieldsOperations.new.get_fields(param_instance)
        unless response.nil?

          return fields_details if response.status_code == Constants::RESPONSECODE_NO_CONTENT

          if response.is_expected
            data_object = response.data_object

            if data_object.is_a? Fields::ResponseWrapper
              fields = data_object.fields

              fields.each do |field|
                key_name = field.api_name
                next if Constants::KEYS_TO_SKIP.include? key_name

                field_detail = {}
                set_data_type(field_detail, field, module_api_name)
                fields_details[key_name] = field_detail
              end
              if Constants::INVENTORY_MODULES.include? module_api_name.downcase
                field_detail = {}
                field_detail[Constants::NAME] = Constants::LINE_TAX
                field_detail[Constants::TYPE] = Constants::LIST_NAMESPACE
                field_detail[Constants::STRUCTURE_NAME] = Constants::LINE_TAX_NAMESPACE
                fields_details[Constants::LINE_TAX] = field_detail
              end

              if module_api_name.downcase == Constants::NOTES.downcase
                field_detail = {}
                field_detail[Constants::NAME] = Constants::ATTACHMENTS
                field_detail[Constants::TYPE] = Constants::LIST_NAMESPACE
                field_detail[Constants::STRUCTURE_NAME] = Constants::ATTACHMENTS_NAMESPACE
                fields_details[Constants::ATTACHMENTS] = field_detail
              end

            elsif data_object.is_a? Fields::APIException
              error_response = {}
              error_response[Constants::CODE] = data_object.code.value
              error_response[Constants::STATUS] = data_object.status.value
              error_response[Constants::MESSAGE] = data_object.message
              error_response[Constants::DETAILS] = data_object.details
              exception = SDKException.new(Constants::API_EXCEPTION, nil, error_response)
              if @@module_api_name == module_api_name.downcase
                raise exception
              end
              SDKLog::SDKLogger.severe(Constants::API_EXCEPTION, exception)
            end
          else
            error_response = {}
            error_response[Constants::CODE] = response.status_code
            raise SDKException.new(Constants::API_EXCEPTION, nil, error_response)
          end
        end
        fields_details
      end

      def self.get_json_object(json, key)
        json.each_key do |key_in_json|
          return json[key_in_json] if key_in_json == key
        end
        nil
      end

      def self.fill_data_type
        return unless @@apitype_vs_datatype.empty?

        field_api_names_string = %w[autonumber textarea text website email phone mediumtext profileimage]
        field_api_names_integer = %w[integer]
        field_api_names_boolean = %w[boolean]
        field_api_names_long = %w[bigint long]
        field_api_names_double = %w[double percent currency]
        field_api_names_field_file = %w[fileupload]
        field_api_names_datetime = %w[datetime event_reminder]
        field_api_names_date = %w[date]
        field_api_names_lookup = %w[lookup]
        field_api_names_picklist = %w[picklist]
        field_api_names_multiselect_picklist = %w[multiselectpicklist]
        field_api_names_subform = %w[subform]
        field_api_names_owner_lookup = %w[ownerlookup userlookup]
        field_api_names_multiuser_lookup = %w[multiuserlookup]
        field_api_names_multimodule_lookup = %w[multi_module_lookup]
        field_api_names_task_remind_at = %w[ALARM]
        field_api_names_recurring_activity = %w[RRULE]
        field_api_names_reminder = %w[multireminder]
        field_api_names_consent_look_up = %w[consent_lookup]
        field_api_name_image_upload = %w[imageupload]
        field_api_name_multiselect_lookup = %w[multiselectlookup]
        field_api_name_line_tax = %w[linetax]
        field_api_name_time_range = %w[time_range]

        field_api_names_string.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::STRING
        end

        field_api_names_integer.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::INTEGER
        end

        field_api_names_boolean.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::BOOLEAN
        end

        field_api_names_double.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::DOUBLE
        end

        field_api_names_long.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LONG
        end

        field_api_names_field_file.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE
          @@apitype_vs_structurename[field_api_name] = Constants::FIELD_FILE_NAMESPACE
        end

        field_api_names_task_remind_at.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::REMINDAT_NAMESPACE
          @@apitype_vs_structurename[field_api_name] = Constants::REMINDAT_NAMESPACE
        end

        field_api_names_recurring_activity.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::RECURRING_ACTIVITY_NAMESPACE
          @@apitype_vs_structurename[field_api_name] = Constants::RECURRING_ACTIVITY_NAMESPACE
        end

        field_api_names_reminder.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE
          @@apitype_vs_structurename[field_api_name] = Constants::REMINDER_NAMESPACE
        end

        field_api_names_datetime.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::DATETIME_NAMESPACE
        end

        field_api_names_date.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::DATE_NAMESPACE
        end

        field_api_names_lookup.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::RECORD_NAMESPACE

          @@apitype_vs_structurename[field_api_name] = Constants::RECORD_NAMESPACE
        end

        field_api_names_owner_lookup.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::USER_NAMESPACE

          @@apitype_vs_structurename[field_api_name] = Constants::USER_NAMESPACE
        end

        field_api_names_multiuser_lookup.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE

          @@apitype_vs_structurename[field_api_name] = Constants::RECORD_NAMESPACE
        end

        field_api_names_multimodule_lookup.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::RECORD_NAMESPACE

          @@apitype_vs_structurename[field_api_name] = Constants::RECORD_NAMESPACE
        end

        field_api_names_picklist.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::CHOICE_NAMESPACE
        end

        field_api_names_multiselect_picklist.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE

          @@apitype_vs_structurename[field_api_name] = Constants::CHOICE_NAMESPACE
        end

        field_api_names_subform.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE

          @@apitype_vs_structurename[field_api_name] = Constants::RECORD_NAMESPACE
        end

        field_api_names_consent_look_up.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::CONSENT_NAMESPACE

          @@apitype_vs_structurename[field_api_name] = Constants::CONSENT_NAMESPACE
        end

        field_api_name_image_upload.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE
          
          @@apitype_vs_structurename[field_api_name] = Constants::IMAGEUPLOAD_NAMESPACE
        end

        field_api_name_multiselect_lookup.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE
          
          @@apitype_vs_structurename[field_api_name] = Constants::RECORD_NAMESPACE
        end

        field_api_name_line_tax.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE
          
          @@apitype_vs_structurename[field_api_name] = Constants::LINE_TAX_NAMESPACE
        end
        field_api_name_time_range.each do |field_api_name|
          @@apitype_vs_datatype[field_api_name] = Constants::LIST_NAMESPACE
          @@apitype_vs_structurename[field_api_name] = Constants::TIME_RANGE_NAMESPACE
        end
      end

      def self.set_data_type(field_detail, field_instance, module_api_name)
        data_type = field_instance.data_type

        key_name = field_instance.api_name

        module_name = Modules::MinifiedModule.new

        module_api_name = module_api_name.downcase
        if !field_instance.system_mandatory.nil? && field_instance.system_mandatory && !((module_api_name == Constants::CALLS.downcase) && (key_name.downcase == Constants::CALL_DURATION.downcase))
          field_detail[Constants::REQUIRED] = true
        end
      
        if (key_name.downcase == Constants::PRICING_DETAILS.downcase) && (module_api_name == Constants::PRICE_BOOKS.downcase)
          field_detail[Constants::NAME] = key_name
          field_detail[Constants::TYPE] = Constants::LIST_NAMESPACE
          field_detail[Constants::STRUCTURE_NAME] = Constants::PRICINGDETAILS
          field_detail[Constants::SKIP_MANDATORY] = true
          return
        elsif (key_name.downcase == Constants::PARTICIPANT_API_NAME.downcase) && ((module_api_name == Constants::EVENTS.downcase) || (module_api_name == Constants::ACTIVITIES.downcase))
          field_detail[Constants::NAME] = key_name
          field_detail[Constants::TYPE] = Constants::LIST_NAMESPACE
          field_detail[Constants::STRUCTURE_NAME] = Constants::PARTICIPANTS
          field_detail[Constants::SKIP_MANDATORY] = true
          return
        elsif (key_name.downcase == Constants::COMMENTS.downcase) && ((module_api_name == Constants::SOLUTIONS.downcase) || (module_api_name == Constants::CASES.downcase))
          field_detail[Constants::NAME] = key_name
          field_detail[Constants::TYPE] = Constants::LIST_NAMESPACE
          field_detail[Constants::STRUCTURE_NAME] = Constants::COMMENTS_NAMESPACE
          field_detail[Constants::LOOKUP] = true
          return
        elsif key_name.downcase == Constants::LAYOUT.downcase
          field_detail[Constants::NAME] = key_name
          field_detail[Constants::TYPE] = Constants::LAYOUT_NAMESPACE
          field_detail[Constants::LOOKUP] = true
          field_detail[Constants::STRUCTURE_NAME] = Constants::LAYOUT_NAMESPACE
          return
        elsif (key_name.downcase == Constants::TERRITORIES.downcase || key_name.downcase == Constants::TERRITORY.downcase) && !field_instance.custom_field.nil? && !field_instance.custom_field
          field_detail[Constants::NAME] = key_name
          field_detail[Constants::TYPE] = Constants::LIST_NAMESPACE
          field_detail[Constants::STRUCTURE_NAME] = Constants::TERRITORY_NAMESPACE
          field_detail[Constants::LOOKUP] = true
          return
        elsif key_name.downcase == Constants::PRODUCT_NAME.downcase && Constants::INVENTORY_MODULES_ITEMS.include?(module_api_name.downcase)
          field_detail[Constants::NAME] = key_name
          field_detail[Constants::TYPE] = Constants::LINEITEM_PRODUCT
          field_detail[Constants::STRUCTURE_NAME] = Constants::LINEITEM_PRODUCT
          field_detail[Constants::SKIP_MANDATORY] = true
          return
        elsif key_name.downcase == Constants::DISCOUNT.downcase && Constants::INVENTORY_MODULES_ITEMS.include?(module_api_name.downcase)
          field_detail[Constants::NAME] = key_name
          field_detail[Constants::TYPE] = Constants::STRING
          return
        elsif key_name.downcase == Constants::TAX.downcase && module_api_name.downcase() == Constants::PRODUCTS.downcase
          field_detail[Constants::NAME] = key_name
          field_detail[Constants::TYPE] = Constants::LIST_NAMESPACE
          field_detail[Constants::STRUCTURE_NAME] = Constants::TAX_NAMESPACE
          return
        elsif @@apitype_vs_datatype.include? data_type
          field_detail[Constants::TYPE] = @@apitype_vs_datatype[data_type]
        elsif data_type == Constants::FORMULA.downcase
          unless field_instance.formula.nil?
            return_type = field_instance.formula.return_type
            unless @@apitype_vs_datatype[return_type].nil?
              field_detail[Constants::TYPE] = @@apitype_vs_datatype[return_type]
            end
            field_detail[Constants::READ_ONLY] = true
          end
        elsif data_type == Constants::ROLLUP_SUMMARY.downcase
          unless field_instance.rollup_summary.nil?
            return_type = field_instance.rollup_summary.return_type
            if !@@apitype_vs_datatype[return_type].nil?
              field_detail[Constants::TYPE] = @@apitype_vs_datatype[return_type]
            elsif !@@apitype_vs_datatype[field_instance.json_type].nil?
              field_detail[Constants::TYPE] = !@@apitype_vs_datatype[field_instance.json_type]
            end
          end
        else
          return
        end
        field_detail[Constants::LOOKUP] = true if data_type.downcase.include? Constants::LOOKUP
        if (data_type.downcase.include? Constants::CONSENT_LOOKUP) || (data_type.downcase.include? Constants::OWNER_LOOKUP)
          field_detail[Constants::SKIP_MANDATORY] = true
        end
        
        if data_type.downcase.include? Constants::MULTI_SELECT_LOOKUP
          field_detail[Constants::SKIP_MANDATORY] = true
          unless field_instance.multiselectlookup.nil?
            unless field_instance.multiselectlookup.linking_details.nil?
              linking_details = field_instance.multiselectlookup.linking_details
              unless linking_details.nil?
                linking_module = linking_details.module
                field_detail[Constants::MODULE] = linking_module.api_name
                module_name = Modules::MinifiedModule.new
                module_name.api_name = linking_module.api_name
                module_name.id = linking_module.id
              end
            end
          end
          field_detail[Constants::SUBFORM] = true
        end

        if data_type.downcase.include? Constants::MULTI_USER_LOOKUP
          field_detail[Constants::SKIP_MANDATORY] = true
          unless field_instance.multiuserlookup.nil?
            unless field_instance.multiuserlookup.linking_details.nil?
              linking_details = field_instance.multiuserlookup.linking_details
              unless linking_details.nil?
                linking_module = linking_details.module
                field_detail[Constants::MODULE] = linking_module.api_name
                module_name = Modules::MinifiedModule.new
                module_name.api_name = linking_module.api_name
                module_name.id = linking_module.id
              end
            end
          end
          field_detail[Constants::SUBFORM] = true
        end

        if data_type.downcase.include? Constants::MULTI_MODULE_LOOKUP
          field_detail[Constants::SKIP_MANDATORY, true]
        end

        if @@apitype_vs_structurename.include? data_type
          field_detail[Constants::STRUCTURE_NAME] = @@apitype_vs_structurename[data_type]
        end

        if (data_type.downcase == Constants::PICKLIST.downcase) && !field_instance.pick_list_values.nil? && !field_instance.pick_list_values.empty?
          values = []

          field_instance.pick_list_values.each do |pick_list_value|
            values.push(pick_list_value.display_value)
          end
          field_detail[Constants::PICKLIST] = true
          field_detail[Constants::VALUES] = values
        end

        if data_type.downcase == Constants::SUBFORM.downcase
          module_name.api_name = field_instance.associated_module.module
          field_detail[Constants::SUBFORM] = true
          field_detail[Constants::SKIP_MANDATORY] = true
          field_detail[Constants::MODULE] = module_name.api_name
        end

        if data_type.downcase == Constants::LOOKUP.downcase && !field_instance.lookup.nil?
          module_1 = field_instance.lookup.module
          if !module_1.nil? && (module_1.api_name.downcase != Constants::SE_MODULE.downcase)
            module_name.api_name = module_1.api_name
            module_name.id = module_1.id
            field_detail[Constants::MODULE] = module_1.api_name
            if (module_1.api_name.downcase == Constants::ACCOUNTS.downcase) && !field_instance.custom_field
              field_detail[Constants::SKIP_MANDATORY] = true
            end
          else
            module_name = Modules::MinifiedModule.new
          end
          field_detail[Constants::LOOKUP] = true
        end
        if !module_name.nil? && !module_name.api_name.nil? && module_name.api_name.length > 0
          get_fields_info(module_name.api_name, nil)
        end
        field_detail[Constants::NAME] = key_name
      end
    
      def self.get_modules(header)
        require_relative '../modules/modules_operations'
        api_names = {}
        header_map = HeaderMap.new
        parameter_map = ParameterMap.new
        unless header.nil?
          header_value = Time.at(header.to_i / 1000).iso8601
          header_map.add(Modules::ModulesOperations::GetModulesHeader.If_modified_since, DateTime.parse(header_value))
        end
        response = Modules::ModulesOperations.new.get_modules(parameter_map, header_map)

        unless response.nil?
          if [Constants::RESPONSECODE_NO_CONTENT, Constants::RESPONSECODE_NOT_MODIFIED].include? response.status_code
            return api_names
          end

          if response.is_expected
            response_object = response.data_object
            if response_object.is_a? Modules::ResponseWrapper
              modules = response_object.modules
              modules.each do |module_ins|
                if module_ins.api_supported
                  module_details = {}
                  module_details[Constants::API_NAME] = module_ins.api_name
                  module_details[Constants::GENERATED_TYPE] = module_ins.generated_type.value 
                  api_names[module_ins.api_name.downcase] = module_details
                end
              end
            elsif response_object.is_a? Modules::APIException
              error_response = {}
              error_response[Constants::CODE] = response_object.code.value
              error_response[Constants::STATUS] = response_object.status.value
              error_response[Constants::MESSAGE] = response_object.message
              raise SDKException.new(Constants::API_EXCEPTION, nil, error_response)
            end
          end
        end
        if header.nil?
          begin
            initializer = Initializer.get_initializer
            resoures_folder_path = initializer.resources_path + '/' + Constants::RESOURCES
            Dir.mkdir resoures_folder_path unless File.exist? resoures_folder_path
            record_field_details_path = get_record_json_file_path()
            write_module_meta_data(record_field_details_path, api_names)
          end
        end
        api_names
      end

      def self.check_related_list_exists(related_module_name, module_related_list_ja, common_api_handler)
        (0..module_related_list_ja.length - 1).each do |i|
          related_list_jo = module_related_list_ja[i]
          if !related_list_jo[Constants::API_NAME].nil? && (related_list_jo[Constants::API_NAME].downcase == related_module_name.downcase)
            if related_list_jo[Constants::HREF] == Constants::NULL_VALUE
              raise SDKException.new(Constants::UNSUPPORTED_IN_API, common_api_handler.http_method + ' ' + common_api_handler.api_path + Constants::UNSUPPORTED_IN_API_MESSAGE)
            end

            if related_list_jo[Constants::MODULE] != Constants::NULL_VALUE
              common_api_handler.module_api_name = related_list_jo[Constants::MODULE]
              get_fields_info(related_list_jo[Constants::MODULE], common_api_handler)
            end
            return true
          end
        end
        false
      end

      def self.verify_photo_support(module_api_name)
        @@sync_lock.synchronize do
          begin
            module_api_name = verify_module_api_name(module_api_name)
            if Constants::PHOTO_SUPPORTED_MODULES.include? module_api_name.downcase
              return true
            end
            modules = get_module_names

            if modules.key? module_api_name.downcase || !modules[module_api_name.downcase].nil?
              module_meta_data = modules[module_api_name.downcase]

              if module_meta_data.key? Constants::GENERATED_TYPE && module_meta_data[Constants::GENERATED_TYPE] != Constants::GENERATED_TYPE_CUSTOM
                  raise SDKException.new(Constants::UPLOAD_PHOTO_UNSUPPORTED_ERROR,Constants::UPLOAD_PHOTO_UNSUPPORTED_MESSAGE + module_api_name)
              end
            end
          rescue SDKException => e
            raise e
          rescue StandardError => e
            ex = SDKException.new(nil, Constants::EXCEPTION, nil, e)
            SDKLog::SDKLogger.severe(Constants::EXCEPTION, ex)
            raise ex
          end
          return true 
        end
      end
      
      def self.get_module_names
        module_data = {}
        initializer = Initializer.get_initializer
        resoures_folder_path = initializer.resources_path + '/' + Constants::RESOURCES
        Dir.mkdir resoures_folder_path unless File.exist? resoures_folder_path

        record_field_details_path = get_record_json_file_path

        call_get_modules = false
        if File.exists? record_field_details_path
          json = JSON.parse(File.read(record_field_details_path))
          if !json.key? Constants::SDK_MODULE_METADATA
            call_get_modules = true
          elsif json[Constants::SDK_MODULE_METADATA].nil? || json[Constants::SDK_MODULE_METADATA].length == 0
            call_get_modules = true
          end
        else
          call_get_modules = true
        end
        if call_get_modules
          module_data = get_modules(nil)
          write_module_meta_data(record_field_details_path, module_data)
          return module_data
        end
        record_field_details_json = JSON.parse(File.read(record_field_details_path))
        module_data = record_field_details_json[Constants::SDK_MODULE_METADATA]
        return module_data
      end

      def self.write_module_meta_data(record_field_details_path, module_data)
        field_details_json = (File.exist? record_field_details_path) ? JSON.parse(File.read(record_field_details_path)):{}
        field_details_json[Constants::SDK_MODULE_METADATA] = module_data
        write_to_file(record_field_details_path, field_details_json)
      end

      def self.get_related_list_details(module_api_name)
        require_relative '../related_lists/related_lists_operations'
        param_instance = ParameterMap.new
        param_instance.add(RelatedLists::RelatedListsOperations::GetRelatedListsParam.module_1, module_api_name)
        rlo = RelatedLists::RelatedListsOperations.new(nil)
        response = rlo.get_related_lists(param_instance)
        related_lists_ja = []
        unless response.nil?
          return related_lists_ja if response.status_code == Constants::RESPONSECODE_NO_CONTENT

          if response.is_expected
            response_handler = response.data_object
            if response_handler.is_a? RelatedLists::ResponseWrapper
              response_wrapper = response_handler
              related_lists = response_wrapper.related_lists
              related_lists.each do |related_list|
                related_list_detail = {}
                related_list_detail[Constants::API_NAME] = related_list.api_name
                related_list_detail[Constants::MODULE] = related_list.module.nil? ? Constants::NULL_VALUE : related_list.module
                related_list_detail[Constants::NAME] = related_list.name
                related_list_detail[Constants::HREF] = related_list.href.nil? ? Constants::NULL_VALUE : related_list.href
                related_lists_ja.push(related_list_detail)
              end
            elsif response_handler.is_a? RelatedLists::APIException
              exception = response_handler
              error_response = {}
              error_response[Constants::CODE] = exception.code.value
              error_response[Constants::STATUS] = exception.status.value
              error_response[Constants::MESSAGE] = exception.message
              raise SDKException.new(Constants::API_EXCEPTION, nil, error_response)
            end
          else
            error_response = {}
            error_response[Constants::CODE] = response.status_code
            raise SDKException.new(Constants::API_EXCEPTION, nil, error_response)
          end
        end
        related_lists_ja
      end

      def self.get_current_time_in_millis
        (Time.now.to_f * 1000).to_i
      end

      def self.refresh_modules
        @@force_refresh = true
        get_fields_info(nil)
        @@force_refresh = false
      end

      def self.classname_to_filename(class_name)
        changed_class_name = ''

        if class_name != "APIs"
          camel_case_split = class_name.to_s.split(/(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])/)
          camel_case_split.each_with_index do |each_name, i|
            changed_class_name += Constants::UNDERSCORE if i.positive?
            changed_class_name += each_name.to_s.downcase
         end
        else
          changed_class_name = class_name.downcase
        end
        changed_class_name
      end

      def self.class_to_load(class_path)
        package_to_load = 'ZOHOCRMSDK::'

        class_path = class_path.to_s

        split_names = class_path.split(Constants::DOT)

        package_name_split = split_names[-2].to_s.split(Constants::UNDERSCORE)

        package_name_split.each do |name|
          if name == "apis"
            name = "APIs"
            package_to_load += name
          else
            name[0] = name[0].to_s.upcase
            package_to_load += name
          end
        end

        package_to_load += Constants::DOUBLE_COLON

        package_to_load += split_names[-1]

        package_to_load
      end

      def self.path_to_package(class_path)
        if class_path.to_s.include? Constants::DOUBLE_COLON
          name = Constants::PACKAGE_PREFIX
          class_path = class_path.to_s
          class_split = class_path.to_s.split(Constants::DOUBLE_COLON)
          class_split[1] = classname_to_filename(class_split[1])
          name += class_split[1] + Constants::DOT + class_split[2]
          name
        else
          class_path
        end
      end

      def self.get_user_name(token)
        user_name = nil
        param_instance = ParameterMap.new
        param_instance.add(Users::UsersOperations::GetUsersParam.type, Choice.new(Constants::CURRENTUSER))
        header_instance = HeaderMap.new
        handler_instance = Handler::CommonAPIHandler.new
        api_path = String.new
        api_path = api_path.concat("/crm/v8/users")
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.param = param_instance
        header_instance.add(Header.new(Constants::AUTHORIZATION, Constants::STRING), Constants::OAUTH_HEADER_PREFIX + token)
        handler_instance.header= header_instance
        response = handler_instance.api_call(Users::ResponseHandler.name, 'application/json')
        unless response.nil?
          if [204, 304].include?(response.status_code)
            return nil
          end
          if response.is_expected
            response_handler = response.data_object
            if response_handler.is_a? Users::ResponseWrapper
              response_wrapper = response_handler
              users = response_wrapper.users
              users.each do |user|
                user_name = user.email
                break
              end
            elsif response_handler.is_a? Users::APIException
              exception = response_handler
              error_response = {}
              error_response[Constants::CODE] = exception.code.value
              error_response[Constants::STATUS] = exception.status.value
              error_response[Constants::MESSAGE] = exception.message
              raise SDKException.new(nil , Constants::API_EXCEPTION, error_response, nil)
            end
          end
        end
        org_id = get_user_org_id(token)
        if user_name.nil? || org_id.nil?
          return nil
        end
        user_name + ":" + get_user_org_id(token)
      end

      def self.get_user_org_id(token)
        header_instance = HeaderMap.new
        handler_instance = Handler::CommonAPIHandler.new
        api_path = String.new
        api_path = api_path.concat("/crm/v8/org")
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        header_instance.add(Header.new(Constants::AUTHORIZATION, Constants::STRING), Constants::OAUTH_HEADER_PREFIX + token)
        handler_instance.header= header_instance
        response = handler_instance.api_call(Org::ResponseHandler.name, 'application/json')
        unless response.nil?
          if response.is_expected
            response_handler = response.data_object
            if response_handler.is_a? Org::ResponseWrapper
              response_wrapper = response_handler
              orgs = response_wrapper.org
              orgs.each do |org|
                return org.zgid
              end
            elsif response_handler.is_a? Org::APIException
              exception = response_handler
              error_response = {}
              error_response[Constants::CODE] = exception.code.value
              error_response[Constants::STATUS] = exception.status.value
              error_response[Constants::MESSAGE] = exception.message
              raise SDKException.new(nil , Constants::API_EXCEPTION, error_response, nil)
            end
          end
        end
        nil
      end
      def self.check_data_type(value, type)
        if value.nil?
          return false
        end
        if type.downcase == Constants::OBJECT.downcase
          return true
        end
        if Constants::DATA_TYPE.include? type
          type = Constants::DATA_TYPE[type].downcase
        end
        class_name = value.class.name.downcase
        if type.downcase == Constants::BOOLEAN.downcase
          class_name = ([true, false].include? value) ? Constants::BOOLEAN.downcase : class_name
        else
          class_name = path_to_package(value.class.name).downcase
        end
        class_name.downcase == type.downcase
      end
    end
  end
end