module Jibeset
  # Wrapper for the Rdio API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {TODO:doc_URL the Instagram API Documentation}.
  # @see TODO:doc_url
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include Jibeset::Client::Utils

    include Jibeset::Client::Users
    #include Jibeset::Client::Media
    #include Jibeset::Client::Locations
    #include Jibeset::Client::Geographies
    #include Jibeset::Client::Tags
    #include Jibeset::Client::Comments
    #include Jibeset::Client::Likes
    #include Jibeset::Client::Subscriptions
  end
end

