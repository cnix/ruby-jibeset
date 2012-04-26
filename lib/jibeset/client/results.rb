module Jibeset
  class Client
    module Results

      def results(payload={})
        if payload[:user_id]
          get("/users/#{payload[:user_id]}/results")
        elsif payload[:boat_id]
          get("/boats/#{payload[:boat_id]}/results")
        elsif payload[:event_id]
          get("/events/#{payload[:event_id]}/results")
        elsif payload[:race_id]
          get("/races/#{payload[:race_id]}/results")
        end
      end

      def create_result(payload)
        post("/results", payload)
      end

      def update_result(payload)
        put("/results/#{payload[:id]}", payload)
      end

    end
  end
end
