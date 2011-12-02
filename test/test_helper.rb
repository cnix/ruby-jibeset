require 'rubygems'
require 'test/unit'
require 'ruby-debug'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'jibeset'

module Jibeset
  class Test < Test::Unit::TestCase
  
    def self.valid_config
      -> {
        Jibeset.configure do |config|
          Jibeset.adapter          = :net_http
          Jibeset.client_id        =  nil
          Jibeset.client_secret    =  nil
          Jibeset.access_token     =  nil
          Jibeset.oauth_callback   =  nil
          Jibeset.endpoint         = 'http://jibeset.heroku.com/'
          Jibeset.format           = 'json'
          Jibeset.user_agent       = 'Jibeset Ruby Gem 0.1'
          Jibeset.proxy            =  'wtf'
        end
      }
    end

  end

  class API
    attr_accessor :stubs

    def connection(raw=false)
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => endpoint,
        :client_id => client_id,
        :access_token => access_token
      }

      Faraday.new(options) do |connection|
        connection.request :json
        connection.adapter :test, @stubs
      end
    end
  end
end
