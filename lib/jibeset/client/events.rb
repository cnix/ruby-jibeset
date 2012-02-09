module Jibeset
  class Client
    module Events

      def events(payload={})
        if payload[:user_id]
          get("/users/#{payload[:user_id]}/events")
        elsif payload[:organization_id]
          get("/organizations/#{payload[:organization_id]}/events")
        else
          get("/events")
        end
      end

      def event(payload)
        get("/events/#{payload[:id]}")
      end

      def event_entries(payload)
        get("/events/#{payload[:id]}/entries")
      end

      def event_fleets(payload)
        get("/events/#{payload[:id]}/fleets")
      end

      def create_event(payload)
        post("/events", payload)
      end

      def update_event(payload)
        put("/events/#{payload[:id]}", payload)
      end

      def destroy_event(payload)
        delete("/events/#{payload[:id]}")
      end

      def register_entry(payload)
        post("/events/#{payload[:event_id]}/entries", payload)
      end

    end
  end
end

