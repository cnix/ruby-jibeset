module Jibeset
  class Client
    module Fleets

      def fleets(payload={})
        if payload[:event_id]
          get("/events/#{payload[:event_id]}/fleets")
        else
          get("/fleets")
        end
      end

      def fleet(payload)
        get("/fleets/#{payload[:id]}")
      end

      def create_fleet(payload)
        post("/fleets", payload)
      end

      def update_fleet(payload)
        put("/fleets/#{payload[:id]}", payload)
      end

      def destroy_fleet(payload)
        delete("/fleets/#{payload[:id]}")
      end

    end
  end
end
