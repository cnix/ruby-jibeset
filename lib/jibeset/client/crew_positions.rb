module Jibeset
  class Client
    module CrewPositions

      def crew_positions(payload)
        if payload[:boat_id]
          get("/boats/#{payload[:boat_id]}/crew_positions")
        elsif payload[:user_id]
          get("/users/#{payload[:user_id]}/crew_positions")
        elsif payload[:entry_id]
          get("/entries/#{payload[:entry_id]}/crew_positions")
        end
      end

    end
  end
end


