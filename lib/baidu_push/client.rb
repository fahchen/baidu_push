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

    def query_bindlist(params = {})
      @request.fetch(:query_bindlist, params)
    end

    private
    def set_api_url
      scheme = @options[:use_ssl] ? 'https' : 'http'
      @api_url = "#{scheme}://#{API_HOST}/rest/#{@options[:api_version]}/channel"
    end
  end
end
