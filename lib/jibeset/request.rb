module Jibeset
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, unformatted=false)
      request(:get, path, options, unformatted)
    end

    # Perform an HTTP POST request
    def post(path, options={}, unformatted=false)
      request(:post, path, options, unformatted)
    end

    # Perform an HTTP PUT request
    def put(path, options={}, unformatted=false)
      request(:put, path, options, unformatted)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, unformatted=false)
      request(:delete, path, options, unformatted)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, unformatted=false)
      response = connection.send(method) do |request|
        path = formatted_path(path) unless unformatted
        case method
        when :get, :delete
          request.url(path, options)
        when :post, :put
          request.path = path
          request.body = options unless options.empty?
        end
      end
      raw ? response : response.body
    end

    def formatted_path(path)
      [path, format].compact.join('.')
    end
  end
  
end

