require 'ZOHOCRMSDK8_0'

class GetEmailTemplates

  def self.get_email_templates
    email_templates_operations = ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations.new
    
    # Optional parameters
    param_instance = ZOHOCRMSDK::ParameterMap.new
    param_instance.add(ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations::GetEmailTemplatesParam.module_1, "Leads")
    param_instance.add(ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations::GetEmailTemplatesParam.category, "created_by_me")
    
    response = email_templates_operations.get_email_templates(param_instance)

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"
      if [204, 304].include?(response.status_code)
        print response.status_code == 204 ? "No Content" : "Not Modified"
        return
      end

      response_handler = response.data_object

      if response_handler.is_a?(ZOHOCRMSDK::EmailTemplates::ResponseWrapper)
        response_wrapper = response_handler
        email_templates_list = response_wrapper.email_templates
        
        if email_templates_list != nil && email_templates_list.length > 0
          email_templates_list.each_with_index do |email_template, index|
            print "EmailTemplate #{index + 1}:\n"
            print "  ID: " + email_template.id.to_s + "\n" if email_template.id != nil
            print "  Name: " + email_template.name.to_s + "\n" if email_template.name != nil
            print "  Subject: " + email_template.subject.to_s + "\n" if email_template.subject != nil
            print "  Category: " + email_template.category.to_s + "\n" if email_template.category != nil
            print "  Description: " + email_template.description.to_s + "\n" if email_template.description != nil
            print "  Associated: " + email_template.associated.to_s + "\n" if email_template.associated != nil
            print "  Editor Mode: " + email_template.editor_mode.to_s + "\n" if email_template.editor_mode != nil
            
            if email_template.created_by != nil
              created_by = email_template.created_by
              print "  Created By: " + created_by.name.to_s + "\n" if created_by.name != nil
            end
            
            if email_template.modified_by != nil
              modified_by = email_template.modified_by
              print "  Modified By: " + modified_by.name.to_s + "\n" if modified_by.name != nil
            end
            
            print "  Created Time: " + email_template.created_time.to_s + "\n" if email_template.created_time != nil
            print "  Modified Time: " + email_template.modified_time.to_s + "\n" if email_template.modified_time != nil
            print "  Last Usage Time: " + email_template.last_usage_time.to_s + "\n" if email_template.last_usage_time != nil
            
            if email_template.folder != nil
              folder = email_template.folder
              print "  Folder: " + folder.name.to_s + "\n" if folder.name != nil
            end
            
            if email_template.module != nil
              module_info = email_template.module
              print "  Module: " + module_info.api_name.to_s + "\n" if module_info.api_name != nil
            end
            
            print "\n"
          end
        end
        
        # Print pagination info
        info = response_wrapper.info
        if info != nil
          print "Pagination Info:\n"
          print "  Page: " + info.page.to_s + "\n" if info.page != nil
          print "  Per Page: " + info.per_page.to_s + "\n" if info.per_page != nil
          print "  Count: " + info.count.to_s + "\n" if info.count != nil
          print "  More Records: " + info.more_records.to_s + "\n" if info.more_records != nil
        end
        
      elsif response_handler.is_a?(ZOHOCRMSDK::EmailTemplates::APIException)
        exception = response_handler
        print "status: " + exception.status.value.to_s + "\n"
        print "code: " + exception.code.value.to_s + "\n"
        print "details: ".to_s + "\n"
        exception.details.each do |k, v|
          print k + ": " + v.to_s + "\n"
        end
        print "message: " + exception.message.to_s + "\n"
      end
    end
  end


  def self.initialize_and_call
    begin
      environment = ZOHOCRMSDK::DC::INDataCenter::PRODUCTION
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", grant_token: "grant_token")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      get_email_templates
    rescue Exception => e
      raise e
    end
  end
end

GetEmailTemplates.initialize_and_call