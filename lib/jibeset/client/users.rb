module Jibeset
  class Client
    module Users

      def current_user(*args)
        response = post("currentUser")
        response["data"]
      end

    end
  end
end
