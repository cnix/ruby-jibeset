module Jibeset
  class Client
    module Entries

      def register(payload)
        post("/events/#{payload[:event_id]}/entries", payload)
      end

      def entries(payload)
        if payload[:fleet_id]
          get("/fleets/#{payload[:fleet_id]}/entries", payload)
        else
          get("/events/#{payload[:event_id]}/entries")
        end
      end

      def entry_count(payload)
        get("/events/#{payload[:id]}/entries/count")
      end

      def entry(payload)
        get("/entries/#{payload[:id]}")
      end

    end
  end
end

