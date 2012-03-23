module Jibeset
  class Client
    module Search

      def search(payload)
        get('/search', payload)
      end

    end
  end
end
