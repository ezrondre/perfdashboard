module Perfdashboard
  class ContextInfo < ActiveRecord::Base
    belongs_to :context

    serialize :data
  end
end
