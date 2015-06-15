require_dependency "speedup_dashboard/application_controller"

module SpeedupDashboard
  class ServersController < ApplicationController

    def index
      @servers = Server.all
      @server = Server.new
    end

    def new
      @server = Server.new
    end

    def create
      @server = Server.new(server_params)
      if @server.save
        flash[:notice] = t(:notice_server_created)
        redirect_to action: :index
      else
        render :new
      end
    end

    private

      def server_params
        params.require(:server).permit(:name, :host)
      end

  end
end
