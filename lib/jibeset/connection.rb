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
        builder.adapter(adapter)
        builder.use Faraday::Response::ParseJson
      end
    end
  end
end

