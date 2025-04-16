require 'ZOHOCRMSDK8_0'

class GetRichTextRecords
    def self.get_rich_text_records(module_api_name)
      record_operations = ZOHOCRMSDK::Record::RecordOperations.new(module_api_name)
      param_instance = ZOHOCRMSDK::ParameterMap.new
      param_instance.add(ZOHOCRMSDK::Record::RecordOperations::GetRichTextRecordsParam.ids, '3477062')
      response = record_operations.get_rich_text_records(param_instance)
      unless response.nil?
        puts "Status Code: #{response.status_code}"
        if [204, 304].include?(response.status_code)
          puts response.status_code == 204 ? "No Content" : "Not Modified"
          return
        end
        if response.is_expected
          response_handler = response.data_object
          if response_handler.is_a?(ZOHOCRMSDK::Record::ResponseWrapper)
            response_wrapper = response_handler
            records = response_wrapper.data
            records.each do |record|
              puts "Record ID: #{record.id}"
              created_by = record.created_by
              unless created_by.nil?
                puts "Record Created By User-ID: #{created_by.id}"
                puts "Record Created By User-Name: #{created_by.name}"
                puts "Record Created By User-Email: #{created_by.email}"
              end
              puts "Record CreatedTime: #{record.created_time}"

              modified_by = record.modified_by
              unless modified_by.nil?
                puts "Record Modified By User-ID: #{modified_by.id}"
                puts "Record Modified By User-Name: #{modified_by.name}"
                puts "Record Modified By User-Email: #{modified_by.email}"
              end
              puts "Record ModifiedTime: #{record.modified_time}"
              puts "Record Field Value (Last_Name): #{record.get_key_value('Last_Name')}"
              puts "Record KeyValues:"
              record.key_values.each do |key, value|
                if value.is_a?(Array)
                  puts "Record KeyName : #{key}"
                  value.each do |data|
                    if data.is_a?(Hash)
                      puts "Record KeyName : #{key} - Value :"
                      data.each { |k, v| puts "#{k} : #{v}" }
                    else
                      puts data
                    end
                  end
                elsif value.is_a?(Hash)
                  puts "Record KeyName : #{key} - Value :"
                  value.each { |k, v| puts "#{k} : #{v}" }
                else
                  puts "Record KeyName : #{key} - Value : #{value}"
                end
              end
            end
            info = response_wrapper.info
            unless info.nil?
              puts "Record Info Count: #{info.count}" unless info.count.nil?
              puts "Record Info MoreRecords: #{info.more_records}" unless info.more_records.nil?
            end
          elsif response_handler.is_a?(ZOHOCRMSDK::Record::APIException)
            exception = response_handler
            puts "Status: #{exception.status.value}"
            puts "Code: #{exception.code.value}"
            puts "Details:"
            exception.details.each { |key, value| puts "#{key}: #{value}" }
            puts "Message: #{exception.message.value}"
          end
        else
          response_object = response.model
          response_object.instance_variables.each do |var|
            puts "#{var.to_s.delete('@')}: #{response_object.instance_variable_get(var)}"
          end
        end
      end
    end
  def self.initialize_and_call
    begin
      environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", grant_token: "grant_token")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      module_api_name = "Leads"
      get_rich_text_records(module_api_name)
    rescue Exception => e
      raise e
    end
  end
end
GetRichTextRecords.initialize_and_call