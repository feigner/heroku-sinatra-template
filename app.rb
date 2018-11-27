require 'sinatra'
require 'dotenv'
require 'digest'
Dotenv.load

class LiquidSwords < Sinatra::Base

  APP_URL = ENV['APP_URL']
  SHARED_SECRET = ENV['SHARED_SECRET']

  def initialize
    super
  end

  get '/' do
    return [200, "Success!"]
  end

  post '/test' do
    hmac = request.env['X_HMAC_SHA256']
    request.body.rewind
    data = request.body.read
    webhook_ok = verify_webhook(hmac, data)

    if not webhook_ok
      return [403, "Unauth'd."]
    end

    json_data = JSON.parse data
    p json_data

    return [200, json_data]
  end

  helpers do
    def verify_webhook(hmac, data)
      digest = OpenSSL::Digest.new('sha256')
      calculated_hmac = Base64.encode64(OpenSSL::HMAC.digest(digest, SHARED_SECRET, data)).strip
      hmac == calculated_hmac
    end
  end
end
