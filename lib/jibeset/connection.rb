require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module Jibeset
  # @private
  module Connection
    private

    def connection
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => endpoint,
        :client_id => client_id,
        :access_token => access_token
      }

      Faraday::Connection.new(options) do |builder|
        builder.use Faraday::Request::OAuth2, client_id, access_token
        # builder.use Faraday::Request::OAuth
        # builder.use Faraday::Response::Logger
        builder.use Faraday::Request::JSON
        builder.use Faraday::Adapter::NetHttp
      end
    end
  end
end

