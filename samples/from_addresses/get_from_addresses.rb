require 'ZOHOCRMSDK8_0'

class GetFromAddresses

  def self.get_from_addresses
    from_addresses_operations = ZOHOCRMSDK::FromAddresses::FromAddressesOperations.new
    response = from_addresses_operations.get_from_addresses

    if response != nil
      print "status Code : " + response.status_code.to_s + "\n"
      if [204, 304].include?(response.status_code)
        print response.status_code == 204 ? "No Content" : "Not Modified"
        return
      end

      response_handler = response.data_object

      if response_handler.is_a?(ZOHOCRMSDK::FromAddresses::ResponseWrapper)
        response_wrapper = response_handler
        from_addresses = response_wrapper.from_addresses
        
        if from_addresses != nil && from_addresses.length > 0
          from_addresses.each do |from_address|
            print "FromAddress Email: " + from_address.email.to_s + "\n"
            print "FromAddress Type: " + from_address.type.to_s + "\n"
            print "FromAddress ID: " + from_address.id.to_s + "\n"
            print "FromAddress UserName: " + from_address.user_name.to_s + "\n"
            print "FromAddress Default: " + from_address.default.to_s + "\n"
            print "------------------------\n"
          end
        else
          print "No from addresses found\n"
        end
        
      elsif response_handler.is_a?(ZOHOCRMSDK::FromAddresses::APIException)
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
      token = ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"client_id", client_secret:"client_secret", refresh_token: "refresh_token")
      ZOHOCRMSDK::Initializer.initialize(environment: environment, token: token)
      get_from_addresses
    rescue Exception => e
      raise e
    end
  end
end

GetFromAddresses.initialize_and_call