module Jibeset
  class Client
    module Users

      def create_user(payload)
        post("/users", payload)
      end

      def user(payload)
        get("/users/#{payload[:id]}")
      end

      def update_user(payload)
        put("/users/#{payload[:id]}", payload)
      end

      def destroy_user(payload)
        delete("/users/#{payload[:id]}")
      end

      def me
        get("/me")
      end

    end
  end
end
