module Jibeset
  class Client
    module Boat

      def boats(payload={})
        if payload[:boat]
          post('/boats', payload)
        elsif payload[:user_id]
          get("/users/#{payload[:user_id]}/boats")
        else
          get("/boats")
        end
      end

      def boat(payload)
        get("/boats/#{payload[:id]}")
      end

      def update_boat(payload)
        put("/boats/#{payload[:boat][:id]}", payload)
      end

      def destroy_boat(payload)
        delete("/boats/#{payload[:id]}")
      end

    end
  end
end
