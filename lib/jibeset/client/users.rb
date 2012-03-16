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

      def login(payload)
        post('/users/sign_in', payload)
      end

      def user_news_feed(payload)
        get("/users/#{payload[:id]}/news_feed", payload)
      end

      def user_activity_feed(payload)
        get("/users/#{payload[:id]}/activity_feed", payload)
      end

    end
  end
end
