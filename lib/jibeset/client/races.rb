module Jibeset
  class Client
    module Races

      def races(payload={})
        if payload[:fleet_id]
          get("/fleets/#{payload[:fleet_id]}/races")
        elsif payload[:event_id]
          get("/events/#{payload[:event_id]}/races")
        else
          get("/races")
        end
      end

      def race(payload)
        get("/races/#{payload[:id]}")
      end

      def create_race(payload)
        post("/races", payload)
      end

      def update_race(payload)
        put("/races/#{payload[:id]}", payload)
      end

      def score_race(payload)
        put("/races/#{payload[:id]}/score", payload)
      end

    end
  end
end
