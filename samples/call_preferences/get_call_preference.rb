require 'ZOHOCRMSDK8_0'

class GetCallPreference

  def self.get_call_preference
    call_preferences_operations = ZOHOCRMSDK::CallPreferences::CallPreferencesOperations.new
    response = call_preferences_operations.get_call_preference

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"
      if [204, 304].include?(response.status_code)
        print response.status_code == 204 ? "No Content" : "Not Modified"
        return
      end

      response_handler = response.data_object

      if response_handler.is_a?(ZOHOCRMSDK::CallPreferences::ResponseWrapper)
        response_wrapper = response_handler
        call_preferences = response_wrapper.call_preferences
        print "CallPreferences ShowFromNumber: " + call_preferences.show_from_number.to_s + "\n"
        print "CallPreferences ShowToNumber: " + call_preferences.show_to_number.to_s + "\n"
      elsif response_handler.is_a?(ZOHOCRMSDK::CallPreferences::APIException)
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
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      get_call_preference
    rescue Exception => e
      raise e
    end
  end
end

GetCallPreference.initialize_and_call