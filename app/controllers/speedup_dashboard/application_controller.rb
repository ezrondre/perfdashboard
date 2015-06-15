module SpeedupDashboard
  class ApplicationController < ActionController::Base

    def render_error(status, message=nil)
      @message = message
      render 'speedup_dashboard/common/error', status: status
      false
    end

    def render_403
      render_error(403)
    end

    def authorize_server
      unless set_server
        return render_403
      end
    end

    def find_optional_server
      @server = Server.find_by(id: params[:server_id])
    end

    private

      def set_server
        key = api_key_from_request
        return false unless key
        Server.current = Server.find_by(api_key: key)
      end

      # Returns the API key present in the request
      def api_key_from_request
        if params[:key].present?
          params[:key].to_s
        elsif request.headers["X-SUR-API-Key"].present?
          request.headers["X-SUR-API-Key"].to_s
        end
      end

  end
end
