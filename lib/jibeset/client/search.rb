module Jibeset
  class Client
    module Search

      def search(query)
        query = { q: query }
        get('/search', query)
      end

    end
  end
end
