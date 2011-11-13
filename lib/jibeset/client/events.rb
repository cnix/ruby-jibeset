module Jibeset
  class Client
    module Events

      def events
        get("/events")
      end

      def event(payload)
        response = get("/events/#{payload[:id]}")
        response.body
      end

      def event_entries(payload)
        response = get("/events/#{payload[:id]}/entries")
        response.body
      end

      def event_fleets(payload)
        response = get("/events/#{payload[:id]}/fleets")
        response.body
      end

      def create_event(payload)
        response = post("/events", payload)
        response.body
      end

      def update_event(payload)
        response = put("/events/#{payload['id']}", payload)
        response.body
      end

      def destroy_event(payload)
        response = delete("/events/#{payload['id']}")
        response.body
      end

      def register_entry(payload)
        response = post("/events/#{payload[:event_id]}/entries", payload)
        response.body
      end

    end
  end
end

