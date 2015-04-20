require_dependency "perfdashboard/application_controller"

require_dependency "perfdashboard/request_store"

module Perfdashboard
  class RequestsController < ApplicationController

    def index
      @from = Time.now - 5.days
      @to = Time.now
      @requests = Request.between(@from, @to)
      @errors_count = @requests.errors.count
      @error_rate = ((@errors_count.to_f / @requests.count) * 10000).round.to_f / 100
    end

    def show

    end

    def create
      @request = Perfdashboard::RequestStore.new(params[:request_id])
      @request.load(params[:contexts], params[:data])
      @request.save

      respond_to do |format|
        format.json { render nothing: true}
      end
    end
  end
end
