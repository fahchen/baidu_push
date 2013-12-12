$LOAD_PATH.unshift( File.dirname(__FILE__), '..', 'lib' )
require 'baidu_push'
require 'webmock/rspec'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.order = 'random'
end
