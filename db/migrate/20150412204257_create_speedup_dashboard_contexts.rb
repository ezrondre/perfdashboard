class CreateSpeedupDashboardContexts < ActiveRecord::Migration
  def change
    create_table :speedup_dashboard_contexts do |t|
      t.integer :context_uid
      t.string :type
      t.string :name
      t.references :request, index: true #, foreign_key: true
      t.integer :context_infos_count, default: 0

      t.timestamps null: false
    end
  end
end
