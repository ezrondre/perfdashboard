module SpeedupDashboard
  class Request < ActiveRecord::Base
    belongs_to :server
    has_many :contexts
    has_many :context_infos, through: :contexts

    scope :between, -> (from, to=Time.now) { where( time: from..to ) }

    scope :errors, -> { where(error: true) }

    def full_action
      "#{controller}##{action}"
    end

  end
end
