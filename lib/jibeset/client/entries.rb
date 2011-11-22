module Jibeset
  class Client
    module Entries

      def register(payload)
        post("/events/#{payload[:event_id]}/entries", payload)
      end

      def entries(payload={})
        get("/events/#{payload[:event_id]}/entries")
      end

    end
  end
end

