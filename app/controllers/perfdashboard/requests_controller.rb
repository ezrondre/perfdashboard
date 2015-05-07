require_dependency "perfdashboard/application_controller"

require_dependency "perfdashboard/request_store"

module Perfdashboard
  class RequestsController < ApplicationController

    before_action :authorize_server, only: [:create]
    before_action :find_optional_server, only: [:index]
    before_action :prepare_contexts

    layout 'perfdashboard/server'

    def index
      scope = (@server && @server.requests)
      scope ||= Request.all

      @from = Time.now - 5.days
      @to = Time.now
      @requests = scope.between(@from, @to)
      if params[:c] && params[:a]
        @action = "#{params[:c]}##{params[:a]}"
        @requests = @requests.where(controller: params[:c], action: params[:a])
      end

      if @context = params[:context]
        @context_data = Context.where(name: @context, request_id: @requests)
      else
        @errors_count = @requests.errors.count
        @error_rate = @requests.count > 0 ? ((@errors_count.to_f / @requests.count) * 10000).round.to_f / 100 : 0
      end

      render "perfdashboard/contexts/#{@context}" if @context
    end

    def show
      @request = Request.find(params[:id])
    end

    def create
      @request = Perfdashboard::RequestStore.new(params[:request_id])
      @request.load(params[:contexts], params[:data])
      @request.save

      respond_to do |format|
        format.json { render nothing: true}
      end
    end

    private
      def prepare_contexts
        @contexts = Context.uniq.pluck(:name)
      end


  end
end
