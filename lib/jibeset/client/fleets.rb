module Jibeset
  class Client
    module Fleets

      def fleets(payload)
        get("/events/#{payload[:event_id]}/fleets")
      end

      def fleet(payload)
        get("/events/#{payload[:event_id]}/fleets/#{payload[:id]}")
      end

      def create_fleet(payload)
        post("/events/#{payload[:event_id]}/fleets", payload)
      end

      def update_fleet(payload)
        put("/events/#{payload[:event_id]}/fleets/#{payload[:id]}", payload)
      end

      def destroy_fleet(payload)
        delete("/events/#{payload[:event_id]}/fleets/#{payload[:id]}")
      end

    end
  end
end