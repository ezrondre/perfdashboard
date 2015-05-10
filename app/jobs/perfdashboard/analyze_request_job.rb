module Perfdashboard
  class AnalyzeRequestJob < ActiveJob::Base
    queue_as :default

    def perform(request_id)
      request = Request.find(request_id)
      Perfdashboard.analyze(request)
    end
  end
end
