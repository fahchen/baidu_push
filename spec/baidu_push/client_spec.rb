require 'spec_helper'

describe BaiduPush::Client do
  let(:api_key) { 'api_key' }
  let(:secret_key) { 'secret_key' }
  let(:client) do
    BaiduPush::Client.new(api_key,
                          secret_key)
  end
  let(:client_use_ssl) do
    BaiduPush::Client.new(api_key,
                          secret_key,
                          { use_ssl: true })
  end

  before(:each) do
    stub_request(:any, /.*channel\.api\.duapp\.com.*/)
      .to_return(status: 200, body: 'body', headers: { 'Content-Type' => 'application/json;charset=utf-8' })
  end

  context '#set_api_url' do
    it 'should use https uri' do
      client_use_ssl.api_url.should == 'https://channel.api.duapp.com/rest/2.0/channel'
    end
    it 'should use http uri' do
      client.api_url.should == 'http://channel.api.duapp.com/rest/2.0/channel'
    end
  end

  context '#query_bindlist' do
    it 'shuold respond to' do
      client.should respond_to(:query_bindlist)
    end
    it 'should not raise error' do
      client.query_bindlist('channel_id')
    end
  end

  context '#request' do
    it 'should respond_to' do
      client.should respond_to(:request)
    end
    it 'should not raise error' do
      client.request
    end
  end

end
