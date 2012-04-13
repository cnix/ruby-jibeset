module Jibeset
  class Client
    module Regattas

      def regattas(payload={})
        if payload[:event_id]
          get("/events/#{payload[:event_id]}/regattas", payload)
        else
          get("/regattas", payload)
        end
      end

      def regatta(payload)
        get("regattas/#{payload[:id]}", payload)
      end

      def create_regatta(payload)
        post("/regattas", payload)
      end

      def update_regatta(payload)
        put("/regattas/#{payload[:id]}")
      end

      def destroy_regatta(payload)
        delete("/regattas/#{payload[:id]}")
      end

    end
  end
end
