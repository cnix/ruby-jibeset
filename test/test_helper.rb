require 'rubygems'
require 'test/unit'
require 'ruby-debug'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'jibeset'

require 'webmock/test_unit'
# Don't care about HTTP requests for now
WebMock.disable_net_connect!

module Jibeset
  class Test < Test::Unit::TestCase
  
    def self.valid_config
      -> {
        Jibeset.configure do |config|
          Jibeset.adapter          = 'DEFAULT_ADAPTER'
          Jibeset.consumer_key     = 'DEFAULT_CONSUMER_KEY'
          Jibeset.consumer_secret  = 'DEFAULT_CONSUMER_SECRET'
          Jibeset.oauth_token      = 'DEFAULT_OAUTH_TOKEN'
          Jibeset.oauth_callback   = 'DEFAULT_OAUTH_CALLBACK'
          Jibeset.endpoint         = 'DEFAULT_ENDPOINT'
          Jibeset.format           = 'DEFAULT_FORMAT'
          Jibeset.user_agent       = 'DEFAULT_USER_AGENT'
          Jibeset.proxy            = 'DEFAULT_PROXY'
        end
      }
    end
  end
end
