module SpeedupDashboard
  class Context < ActiveRecord::Base
    belongs_to :request
    has_many :context_infos

    def self.average_info_count
      values = joins("LEFT OUTER JOIN #{ContextInfo.table_name} ON #{table_name}.id = #{ContextInfo.table_name}.context_id").
      group("#{table_name}.id").count(:context_id).values

      values.any? ? values.sum / values.size : 0
    end

  end
end
