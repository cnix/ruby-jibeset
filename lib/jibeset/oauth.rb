module Jibeset
  # Defines HTTP request methods
  module OAuth
    # Return URL for OAuth authorization
    def authorize_url(options={})
      options[:response_type] ||= "code"
      options[:redirect_uri] = oauth_callback
      params = access_token_params.merge(options)
      connection.build_url("/oauth/authorize/", params).to_s
    end

    # Return an access token from authorization
    def get_access_token(code, options={})
      options[:grant_type] ||= "authorization_code"
      options[:redirect_uri] = oauth_callback
      params = access_token_params.merge(options)
      post("/oauth/token/", params.merge(:code => code), false, unformatted=true)
    end
    

    private

    def access_token_params
      {
        :client_id => client_id,
        :client_secret => client_secret
      }
    end
  end
end

