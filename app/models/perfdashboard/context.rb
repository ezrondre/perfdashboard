module Perfdashboard
  class Context < ActiveRecord::Base
    belongs_to :request
    has_many :context_infos
  end
end
