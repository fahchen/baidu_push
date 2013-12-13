require 'httparty'
require 'open-uri'
require 'digest'

module BaiduPush
  class Request
    include HTTParty

    HTTP_METHOD = :post

    attr_reader :client

    def initialize(client)
      @client = client

      set_base_uri
    end

    def fetch(method, params = {})
      params.merge!({method: method,
                     apikey: @client.api_key,
                     timestamp: Time.now.to_i})
      sign = generate_sign(params)
      params.merge!({ sign: sign })

      options = { body: params }
      self.class.send(HTTP_METHOD, "/#{@client.resource}", options)
    end

    def generate_sign(sign_params)
      params_string = sign_params.sort.map{ |h| h.join('=') }.join
      gather = "#{HTTP_METHOD.to_s.upcase}#{self.class.base_uri}/#{@client.resource}#{params_string}#{@client.secret_key}"

      Digest::MD5.hexdigest(URI::encode_www_form_component(gather))
    end

    private
    def set_base_uri
      self.class.base_uri "#{@client.api_url}"
    end

  end
end
