module Jibeset
  class Client
    module Entries

      def register(payload)
        if payload[:rc_entry]
          post("/entries", payload)
        else
          post("/events/#{payload[:event_id]}/entries", payload)
        end
      end

      def entries(payload)
        if payload[:fleet_id]
          get("/fleets/#{payload[:fleet_id]}/entries", payload)
        elsif payload[:user_id]
          get("/users/#{payload[:user_id]}/entries", payload)
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

