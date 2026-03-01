require 'ZOHOCRMSDK8_0'

class GetWizardById

  def self.get_wizard_by_id
    wizard_id = "1055806000009497009" # Replace with actual wizard ID
    
    wizards_operations = ZOHOCRMSDK::Wizards::WizardsOperations.new
    
    # Create ParameterMap for optional parameters
    param_instance = ZOHOCRMSDK::ParameterMap.new
    param_instance.add(ZOHOCRMSDK::Wizards::WizardsOperations::GetWizardByIDParam.layout_id, "1055806000000035002")
    
    response = wizards_operations.get_wizard_by_id(wizard_id, param_instance)

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
              print "  Containers:\n"
              wizard.containers.each_with_index do |container, container_index|
                print "    Container[" + container_index.to_s + "]:\n"
                
                if container.id != nil
                  print "      ID: " + container.id.to_s + "\n"
                end
                
                if container.layout != nil
                  print "      Layout ID: " + container.layout.id.to_s + "\n"
                  if container.layout.name != nil
                    print "      Layout Name: " + container.layout.name + "\n"
                  end
                end
                
                if container.screens != nil && container.screens.length > 0
                  print "      Screens Count: " + container.screens.length.to_s + "\n"
                  container.screens.each_with_index do |screen, screen_index|
                    print "        Screen[" + screen_index.to_s + "]:\n"
                    
                    if screen.id != nil
                      print "          ID: " + screen.id.to_s + "\n"
                    end
                    
                    if screen.display_label != nil
                      print "          Display Label: " + screen.display_label + "\n"
                    end
                    
                    if screen.api_name != nil
                      print "          API Name: " + screen.api_name + "\n"
                    end
                    
                    if screen.segments != nil && screen.segments.length > 0
                      print "          Segments Count: " + screen.segments.length.to_s + "\n"
                    end
                  end
                end
                
                if container.chart_data != nil
                  chart_data = container.chart_data
                  if chart_data.canvas_width != nil
                    print "      Chart Canvas Width: " + chart_data.canvas_width.to_s + "\n"
                  end
                  if chart_data.canvas_height != nil
                    print "      Chart Canvas Height: " + chart_data.canvas_height.to_s + "\n"
                  end
                  if chart_data.nodes != nil && chart_data.nodes.length > 0
                    print "      Chart Nodes Count: " + chart_data.nodes.length.to_s + "\n"
                  end
                  if chart_data.connections != nil && chart_data.connections.length > 0
                    print "      Chart Connections Count: " + chart_data.connections.length.to_s + "\n"
                  end
                end
              end
            end
            
            print "\n"
          end
        else
          print "No wizard found with ID: " + wizard_id + "\n"
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
      get_wizard_by_id
    rescue Exception => e
      raise e
    end
  end
end

GetWizardById.initialize_and_call