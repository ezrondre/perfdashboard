module Perfdashboard
  class Request < ActiveRecord::Base
    has_many :contexts
    has_many :context_infos, through: :contexts

    scope :between, -> (from, to=Time.now) { where( time: from..to ) }

    scope :errors, -> { where(error: true) }
  end
end
