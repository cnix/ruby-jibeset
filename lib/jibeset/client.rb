module Jibeset
  # Wrapper for the Jibeset API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {TODO:doc_URL the Jibeset API Documentation}.
  # @see TODO:doc_url
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include Jibeset::Client::Utils
    include Jibeset::Client::Users
    include Jibeset::Client::Events
    include Jibeset::Client::Fleets
    include Jibeset::Client::Entries
    include Jibeset::Client::Boat
    include Jibeset::Client::Search
    include Jibeset::Client::Organizations
  end
end

