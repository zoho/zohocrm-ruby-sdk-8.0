require 'ZOHOCRMSDK8_0'

class GetWizards

  def self.get_wizards
    wizards_operations = ZOHOCRMSDK::Wizards::WizardsOperations.new
    response = wizards_operations.get_wizards

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"
      if [204, 304].include?(response.status_code)
        print response.status_code == 204 ? "No Content" : "Not Modified"
        return
      end

      response_handler = response.data_object

      if response_handler.is_a?(ZOHOCRMSDK::Wizards::ResponseWrapper)
        response_wrapper = response_handler
        wizards = response_wrapper.wizards
        
        if wizards != nil && wizards.length > 0
          wizards.each_with_index do |wizard, index|
            print "Wizard[" + index.to_s + "]:\n"
            
            if wizard.id != nil
              print "  ID: " + wizard.id.to_s + "\n"
            end
            
            if wizard.name != nil
              print "  Name: " + wizard.name + "\n"
            end
            
            if wizard.created_time != nil
              print "  Created Time: " + wizard.created_time.to_s + "\n"
            end
            
            if wizard.modified_time != nil
              print "  Modified Time: " + wizard.modified_time.to_s + "\n"
            end
            
            if wizard.module != nil
              print "  Module ID: " + wizard.module.id.to_s + "\n"
              if wizard.module.api_name != nil
                print "  Module API Name: " + wizard.module.api_name + "\n"
              end
            end
            
            if wizard.modified_by != nil
              print "  Modified By ID: " + wizard.modified_by.id.to_s + "\n"
              if wizard.modified_by.name != nil
                print "  Modified By Name: " + wizard.modified_by.name + "\n"
              end
            end
            
            if wizard.profiles != nil && wizard.profiles.length > 0
              print "  Profiles:\n"
              wizard.profiles.each do |profile|
                print "    Profile ID: " + profile.id.to_s + "\n"
                if profile.name != nil
                  print "    Profile Name: " + profile.name + "\n"
                end
              end
            end
            
            if wizard.active != nil
              print "  Active: " + wizard.active.to_s + "\n"
            end
            
            if wizard.containers != nil && wizard.containers.length > 0
              print "  Containers Count: " + wizard.containers.length.to_s + "\n"
            end
            
            print "\n"
          end
        else
          print "No wizards found\n"
        end
        
      elsif response_handler.is_a?(ZOHOCRMSDK::Wizards::APIException)
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
      get_wizards
    rescue Exception => e
      raise e
    end
  end
end

GetWizards.initialize_and_call