module Jibeset
  class Client
    module Followings

      def follow(payload)
        response = put(
          "/#{payload[:followed_type]}s/#{payload[:followed_id]}/followers/#{payload[:user_id]}", payload, true
        )
        response.status == 201 ? true : false
      end

      def unfollow(payload)
        response = delete(
          "/#{payload[:followed_type]}s/#{payload[:followed_id]}/followers/#{payload[:user_id]}", payload, true
        )
        response.status == 200 ? true : false
      end

      def follows?(payload)
        response = get(
          "/#{payload[:followed_type]}s/#{payload[:followed_id]}/followers/#{payload[:user_id]}",{},true
        )
        true if response.status == 204
      rescue Faraday::Error::ResourceNotFound
        false
      end

      def follower_count(payload)
        response = get(
          "/#{payload[:followed_type]}s/#{payload[:followed_id]}/followers/count"
        )
        response.status ? 'Not found' : response[:count]
      end

      def followers(payload)
        get("/#{payload[:followed_type]}s/#{payload[:followed_id]}/followers")
      end

    end
  end
end
