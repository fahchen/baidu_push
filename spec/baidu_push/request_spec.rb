require 'spec_helper'

describe BaiduPush::Request do
  before(:each) do
    @api_key = 'api_key'
    @secret_key = 'secret_key'
    @client_enable_ssl = BaiduPush::Client.new(@api_key,
                                               @secret_key,
                                               { use_ssl: true })
    @client = BaiduPush::Client.new(@api_key,
                                    @secret_key)
    @method = :test
    @resource = 'channel'
  end

  context '#set_base_uri' do
    it 'should set https base_uri' do
      request = BaiduPush::Request.new(@client_enable_ssl)
      request.class.base_uri.should == 'https://channel.api.duapp.com/rest/2.0/channel'
    end
    it 'should set http base_uri' do
      request = BaiduPush::Request.new(@client)
      request.class.base_uri.should == 'http://channel.api.duapp.com/rest/2.0/channel'
    end
  end

  context '#generate_sign' do
    before(:each) do
      @request = BaiduPush::Request.new(@client)
    end
    it 'should not raise error when generate sign' do
      @request.generate_sign(k1: 'v1', k2: 'v2', k3: 'v3')
    end
  end

  context '#fetch' do
    before(:each) do
      stub_request(:any, /.*channel\.api\.duapp\.com.*/)
        .to_return(status: 200, body: 'aa', headers: { 'Content-Type' => 'application/json;charset=utf-8' })
      @request = BaiduPush::Request.new(@client)
    end
    it 'should not raise error when fetch' do
      @request.fetch(@method)
      @request.fetch(@method, 'channel_id')
      @request.fetch(@method, 'channel_id', k: 'v')
    end
  end
end
