module Jibeset
  class Client
    module Users

      def create_user(payload)
        response = post("/users", payload)
        response.body
      end

      def user(payload)
        response = get("/users/#{payload[:id]}")
        response.body
      end

      def update_user(payload)
        response = put("/users/#{payload[:id]}", payload)
        response.body
      end

      def destroy_user(payload)
        response = delete("/users/#{payload[:id]}")
        response.body
      end

      def me
        response = get("/me")
        response.body
      end

    end
  end
end
