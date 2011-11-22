require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module Jibeset
  # @private
  module Connection
    private

    def connection(raw=false)
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => endpoint
      }

      Faraday::Connection.new(options) do |builder|
        builder.use Faraday::Request::OAuth2, client_id, access_token
        builder.use Faraday::Request::JSON

        # It seems that I don't understand the way Faraday likes things ordered.
        # Mashify needs a ruby object to mash, so the response needs to run
        # through ParseJson first. If you order them that way, Mashify gets
        # JSON, and can't mash it. Am I crazy?
        builder.use Faraday::Response::Mashify unless raw
        builder.use Faraday::Response::ParseJson # always deal with json

        builder.adapter(adapter)
      end
    end
  end
end

