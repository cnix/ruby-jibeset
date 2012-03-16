module Jibeset
  class Client
    module Boat

      def boats(payload={})
        if payload[:user_id]
          get("/users/#{payload[:user_id]}/boats")
        else
          get("/boats")
        end
      end

      def boat(payload)
        get("/boats/#{payload[:id]}")
      end

      def create_boat(payload)
        post('/boats', payload)
      end

      def update_boat(payload)
        put("/boats/#{payload[:id]}", payload)
      end

      def destroy_boat(payload)
        delete("/boats/#{payload[:id]}")
      end

      def boat_activity_feed(payload)
        get("/boats/#{payload[:id]}/activity_feed", payload)
      end

    end
  end
end
