require 'ZOHOCRMSDK8_0'

class ShareEmails

  def self.share_emails(module_api_name, id)
    record_share_email_operations = ZOHOCRMSDK::RecordShareEmail::RecordShareEmailOperations.new(module_api_name)
    response = record_share_email_operations.share_emails(id)
    if response
      print "Status Code: " + response.status_code.to_s + "\n"
      action_handler = response.data_object
      if action_handler.is_a?(ZOHOCRMSDK::RecordShareEmail::ActionWrapper)
        action_wrapper = action_handler
        action_responses = action_wrapper.data
        action_responses.each do |action_response|
          if action_response.is_a?(ZOHOCRMSDK::RecordShareEmail::SuccessResponse)
            success_response = action_response
            print "Status: " + success_response.status.value.to_s + "\n"
            print "Code: " + success_response.code.value.to_s + "\n"
            print "Details: \n"
            success_response.details.each do |key, value|
              print key + ": " + value.to_s + "\n"
            end
            print "Message: " + success_response.message.value.to_s + "\n"
          elsif action_response.is_a?(ZOHOCRMSDK::RecordShareEmail::APIException)
            exception = action_response
            print "Status: " + exception.status.value.to_s + "\n"
            print "Code: " + exception.code.value.to_s + "\n"
            print "Details: \n"
            exception.details.each do |key, value|
              print key + ": " + value.to_s + "\n"
            end
            print "Message: " + exception.message.value.to_s + "\n"
          end
        end
      elsif action_handler.is_a?(ZOHOCRMSDK::RecordShareEmail::APIException)
        exception = action_handler
        print "Status: " + exception.status.value.to_s + "\n"
        print "Code: " + exception.code.value.to_s + "\n"
        print "Details: \n"
        exception.details.each do |key, value|
          print key + ": " + value.to_s + "\n"
        end
        print "Message: " + exception.message.value.to_s + "\n"
      end
    end
  end

  def self.initialize_and_call
    begin
      environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"clientId", client_secret:"clientSecret", refresh_token:"refreshToken")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      module_api_name = "Leads"
      id=32342213232
      share_emails(module_api_name, id)
    rescue Exception => e
      raise e
    end
  end
end

ShareEmails.initialize_and_call