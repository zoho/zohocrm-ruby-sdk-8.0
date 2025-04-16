require 'ZOHOCRMSDK8_0'

class UpdateCallPreference

  def self.update_call_preference
    call_preferences_operations = ZOHOCRMSDK::CallPreferences::CallPreferencesOperations.new
    body_wrapper = ZOHOCRMSDK::CallPreferences::BodyWrapper.new
    call_preferences = ZOHOCRMSDK::CallPreferences::CallPreferences.new
    call_preferences.show_from_number = true
    call_preferences.show_to_number = true
    body_wrapper.call_preferences = call_preferences

    response = call_preferences_operations.update_call_preference(body_wrapper)

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"

      action_handler = response.data_object

      if action_handler.is_a?(ZOHOCRMSDK::CallPreferences::ActionWrapper)
        action_wrapper = action_handler
        action_response = action_wrapper.call_preferences

        if action_response.is_a?(ZOHOCRMSDK::CallPreferences::SuccessResponse)
          success_response = action_response
          print "Status: "+ success_response.status.value + "\n"
          print "Code: " + success_response.code.value + "\n"
          print "details: ".to_s + "\n"
          success_response.details.each do |k, v|
            print k + ": " + v.to_s + "\n"
          end

          puts "Message: #{success_response.message}"
        elsif action_response.is_a?(ZOHOCRMSDK::CallPreferences::APIException)
          exception = action_response
          print "status: " + exception.status.value.to_s + "\n"
          print "code: " + exception.code.value.to_s + "\n"
          print "details: ".to_s + "\n"
          exception.details.each do |k, v|
            print k + ": " + v.to_s + "\n"
          end
          print "message: " + exception.message.to_s + "\n"
        end
      elsif action_handler.is_a?(ZOHOCRMSDK::CallPreferences::APIException)
        exception = action_handler
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
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      update_call_preference
    rescue Exception => e
      raise e
    end
  end
end

UpdateCallPreference.initialize_and_call