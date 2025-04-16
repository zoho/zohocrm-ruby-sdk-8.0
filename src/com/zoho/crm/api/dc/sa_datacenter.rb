require_relative 'datacenter'

module ZOHOCRMSDK
  module DC
    class SADataCenter < DataCenter
      def initialize; end

      def get_iam_url
        'https://accounts.zoho.sa/oauth/v2/token'
      end

      def get_file_upload_url
        'https://files.zoho.sa'
      end

      PRODUCTION = Environment.new('https://www.zohoapis.sa', SADataCenter.new.get_iam_url, SADataCenter.new.get_file_upload_url)
      SANDBOX = Environment.new('https://sandbox.zohoapis.sa', SADataCenter.new.get_iam_url, SADataCenter.new.get_file_upload_url)
      DEVELOPER = Environment.new('https://developer.zohoapis.sa', SADataCenter.new.get_iam_url, SADataCenter.new.get_file_upload_url)
    end
  end
end