module BaiduPush
  class Client

    API_HOST = 'channel.api.duapp.com'
    DEFAULT_RESOURCE = 'channel'

    DEFAULT_OPTIONS = {
      use_ssl: false,
      api_version: '2.0'
    }

    attr_reader :api_key, :secret_key, :api_url, :request, :options
    attr_accessor :resource

    def initialize(api_key, secret_key, options = {})
      @api_key, @secret_key = (api_key || '').strip, (secret_key || '').strip
      @options = DEFAULT_OPTIONS.merge options

      set_api_url
      @resource ||= DEFAULT_RESOURCE
      @request = Request.new(self)
    end

    ###################################################
    # Basic API
    #
    def query_bindlist(params = {})
      @request.fetch(:query_bindlist, params)
    end

    def push_msg(push_type, messages, msg_keys, params = {})
      params.merge!({
        push_type: push_type,
        messages: messages.to_json,
        msg_keys: msg_keys
      })
      @request.fetch(:push_msg, params)
    end

    def init_app_ioscert(name, description, release_cert, dev_cert, params = {})
      params.merge!({
        name: name,
        description: description,
        release_cert: release_cert,
        dev_cert: dev_cert
      })
      @request.fetch(:init_app_ioscert, params)
    end

    def update_app_ioscert(params = {})
      @request.fetch(:update_app_ioscert, params)
    end

    def delete_app_ioscert(params = {})
      @request.fetch(:delete_app_ioscert, params)
    end

    def query_app_ioscert(params = {})
      @request.fetch(:query_app_ioscert, params)
    end
    #
    # Basic API
    ###################################################

    private
    def set_api_url
      scheme = @options[:use_ssl] ? 'https' : 'http'
      @api_url = "#{scheme}://#{API_HOST}/rest/#{@options[:api_version]}/channel"
    end
  end
end
