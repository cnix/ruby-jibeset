module Jibeset
  class Client
    module Entries

      def register(payload)
        post("event/#{payload['event']['id']}/entries")
      end

    end
  end
end

