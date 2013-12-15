# BaiduPush

The ruby wrapper of baidu push.

## Installation

Add this line to your application's Gemfile:

    gem 'baidu_push'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baidu_push

## Usage

```ruby
api_key = 'your_api_key'
secret_key = 'your_secret_key'
# Create a client
client = BaiduPush::Client.new(api_key, secret_key)

# Set resource of client
client.resource = 'your_channel_id'
# Query bindlist
client.query_bindlist

# Push messages
messages = { title: 'title', description: 'desc' }
client.push_msg 3, messages, 'android-test', message_type: 1
```
>For more examples refer to the [official doc](http://developer.baidu.com/wiki/index.php?title=docs/cplat/push/api/list)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
