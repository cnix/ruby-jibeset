module Jibeset
  class Client
    module Fleets

      def fleets(payload)
        get("/events/#{payload[:event_id]}/fleets")
      end

      def fleet(payload)
        response = get("/events/#{payload[:event_id]}/fleets/#{payload[:id]}")
        response.body
      end

      def create_fleet(payload)
        response = post("/events/#{payload[:event_id]}/fleets", payload)
        response.body
      end

      def update_fleet(payload)
        response = put("/events/#{payload[:event_id]}/fleets/#{payload[:id]}", payload)
        response.body
      end

      def destroy_fleet(payload)
        response = delete("/events/#{payload[:event_id]}/fleets/#{payload[:id]}")
        response.body
      end

    end
  end
end