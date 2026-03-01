require 'ZOHOCRMSDK8_0'

class GetEmailTemplate

  def self.get_email_template
    template_id = 1055806000017124014  # Replace with actual email template ID
    
    email_templates_operations = ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations.new
    response = email_templates_operations.get_email_template(template_id)

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
          email_template = email_templates_list[0]  # Get first template from the list
          
          print "Email Template Details:\n"
          print "ID: " + email_template.id.to_s + "\n" if email_template.id != nil
          print "Name: " + email_template.name.to_s + "\n" if email_template.name != nil
          print "Subject: " + email_template.subject.to_s + "\n" if email_template.subject != nil
          print "Category: " + email_template.category.to_s + "\n" if email_template.category != nil
          print "Description: " + email_template.description.to_s + "\n" if email_template.description != nil
          print "Associated: " + email_template.associated.to_s + "\n" if email_template.associated != nil
          print "Consent Linked: " + email_template.consent_linked.to_s + "\n" if email_template.consent_linked != nil
          print "Editor Mode: " + email_template.editor_mode.to_s + "\n" if email_template.editor_mode != nil
          
          # Created by information
          if email_template.created_by != nil
            created_by = email_template.created_by
            print "Created By:\n"
            print "  ID: " + created_by.id.to_s + "\n" if created_by.id != nil
            print "  Name: " + created_by.name.to_s + "\n" if created_by.name != nil
          end
          
          # Modified by information
          if email_template.modified_by != nil
            modified_by = email_template.modified_by
            print "Modified By:\n"
            print "  ID: " + modified_by.id.to_s + "\n" if modified_by.id != nil
            print "  Name: " + modified_by.name.to_s + "\n" if modified_by.name != nil
          end
          
          # Time information
          print "Created Time: " + email_template.created_time.to_s + "\n" if email_template.created_time != nil
          print "Modified Time: " + email_template.modified_time.to_s + "\n" if email_template.modified_time != nil
          print "Last Usage Time: " + email_template.last_usage_time.to_s + "\n" if email_template.last_usage_time != nil
          
          # Folder information
          if email_template.folder != nil
            folder = email_template.folder
            print "Folder:\n"
            print "  ID: " + folder.id.to_s + "\n" if folder.id != nil
            print "  Name: " + folder.name.to_s + "\n" if folder.name != nil
          end
          
          # Module information
          if email_template.module != nil
            module_info = email_template.module
            print "Module:\n"
            print "  API Name: " + module_info.api_name.to_s + "\n" if module_info.api_name != nil
          end
          
          # Attachments information
          if email_template.attachments != nil && email_template.attachments.length > 0
            print "Attachments:\n"
            email_template.attachments.each_with_index do |attachment, index|
              print "  Attachment #{index + 1}:\n"
              print "    ID: " + attachment.id.to_s + "\n" if attachment.id != nil
              print "    File Name: " + attachment.file_name.to_s + "\n" if attachment.file_name != nil
              print "    File ID: " + attachment.file_id.to_s + "\n" if attachment.file_id != nil
              print "    Size: " + attachment.size.to_s + "\n" if attachment.size != nil
            end
          end
          
          # Last version statistics
          if email_template.last_version_statistics != nil
            stats = email_template.last_version_statistics
            print "Last Version Statistics:\n"
            print "  Tracked: " + stats.tracked.to_s + "\n" if stats.tracked != nil
            print "  Delivered: " + stats.delivered.to_s + "\n" if stats.delivered != nil
            print "  Opened: " + stats.opened.to_s + "\n" if stats.opened != nil
            print "  Clicked: " + stats.clicked.to_s + "\n" if stats.clicked != nil
            print "  Bounced: " + stats.bounced.to_s + "\n" if stats.bounced != nil
            print "  Sent: " + stats.sent.to_s + "\n" if stats.sent != nil
          end
        else
          print "No email template found with the specified ID\n"
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
      environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", grant_token: "grant_token")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      get_email_template
    rescue Exception => e
      raise e
    end
  end
end

GetEmailTemplate.initialize_and_call