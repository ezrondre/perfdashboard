module SpeedupDashboard
  class ContextInfo < ActiveRecord::Base
    belongs_to :context, counter_cache: true

    serialize :data
  end
end
