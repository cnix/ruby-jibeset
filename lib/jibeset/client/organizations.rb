module Jibeset
  class Client
    module Organizations

      def organizations
        get("/organizations")
      end

      def organization(payload)
        get("/organizations/#{payload[:id]}")
      end

      def create_organization(payload)
        post("/organizations", payload)
      end

      def update_organization(payload)
        put("/organizations/#{payload[:id]}", payload)
      end

      def destroy_organization(payload)
        delete("/organizations/#{payload[:id]}")
      end

      def organization_members(payload)
        get("/organizations/#{payload[:id]}/members")
      end

      def organization_admins(payload)
        get("/organizations/#{payload[:id]}/admins")
      end

      def organization_member(payload)
        get("/organizations/#{payload[:organization_id]}/members/#{payload[:user_id]}")
      end

      def organization_admin(payload)
        response = get("/organizations/#{payload[:organization_id]}/admins/#{payload[:user_id]}", {}, true)
        response.status == 204 ? true : false
      end

      def add_member_to_organization(payload)
        put("/organizations/#{payload[:organization_id]}/members/#{payload[:user_id]}")
      end

      def add_admin_to_organization(payload)
        put("/organizations/#{payload[:organization_id]}/admins/#{payload[:user_id]}")
      end

      def remove_member_from_organization(payload)
        delete("/organizations/#{payload[:organization_id]}/members/#{payload[:user_id]}")
      end

      def remove_admin_from_organization(payload)
        delete("/organizations/#{payload[:organization_id]}/admins/#{payload[:user_id]}")
      end

      def organization_activity_feed(payload)
        get("/organizations/#{payload[:id]}/activity_feed", payload)
      end

    end
  end
end
