module Jibeset
  class Client
    module Entries

      def register(payload)
        response = post("event/#{payload['event']['id']}/entries")
        response.body
      end

    end
  end
end

