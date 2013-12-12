require 'spec_helper'

describe BaiduPush::Client do
  before(:each) do
    @api_key = 'api_key'
    @secret_key = 'secret_key'
  end

  context '#set_api_url' do
    it 'should use https uri' do
      client = BaiduPush::Client.new(@api_key,
                                     @secret_key,
                                     { use_ssl: true })
      client.api_url.should == 'https://channel.api.duapp.com/rest/2.0/channel'
    end
    it 'should use http uri' do
      client = BaiduPush::Client.new(@api_key,
                                     @secret_key)
      client.api_url.should == 'http://channel.api.duapp.com/rest/2.0/channel'
    end
  end

end
