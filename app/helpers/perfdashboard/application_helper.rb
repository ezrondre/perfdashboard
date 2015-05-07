module Perfdashboard
  module ApplicationHelper

    def format_ms(value)
      return '-' unless value
      ((value * 100).round.to_f / 100).to_s + ' ms'
    end
  end
end
