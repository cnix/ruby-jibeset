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
          Jibeset.consumer_key     =  nil
          Jibeset.consumer_secret  =  nil
          Jibeset.oauth_token      =  nil
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

    def connection
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => endpoint,
        :consumer_key => consumer_key,
        :oauth_token => oauth_token
      }

      Faraday.new(options) do |connection|
        connection.request :json
        connection.adapter :test, @stubs
      end
    end
  end
end
