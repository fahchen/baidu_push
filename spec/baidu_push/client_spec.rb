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

  context '#set_api_url' do
    it 'should use https uri' do
      client_use_ssl.api_url.should == 'https://channel.api.duapp.com/rest/2.0/channel'
    end
    it 'should use http uri' do
      client.api_url.should == 'http://channel.api.duapp.com/rest/2.0/channel'
    end
  end

end
