Jibeset
====

Configure
---------
```ruby
# Configure your client with the credentials you got from
# registering your application at jibeset.heroku.com/oauth_clients
Jibeset.configure do |config|
  config.client_id      = 'YOUR_CLIENT_ID'
  config.client_secret  = 'YOUR_CLIENT_SECRET'
  config.endpoint       = 'http://jibeset.heroku.com/'
  config.oauth_callback = 'http://yourapp.example.com/oauth_callback'
end
```

Authorization Flow
------------------
```ruby
# Get an authorization code from the JibeSet OAuth Provider
# Pretend this is in a sinatra app
get '/auth/oauth' do
  redirect Jibeset.authorize_url
end

# Use the authorization code to get an access code
# This will be the action that your callback URL redirects to
get '/auth/oauth/callback' do  
  response = Jibeset.get_access_token(params[:code], :redirect_uri => oauth_callback)
  token = JSON.parse(response.body)["access_token"]
  # Store the access token in the session so you can get it later to sign
  # subsuquent requests.
  session[:jibeset_token] = token
  # Create a client
  client = Jibeset.client(:access_token => token)
  client.me # => returns authenticated user
end
