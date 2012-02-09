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
        end
      end

    end
  end
end
