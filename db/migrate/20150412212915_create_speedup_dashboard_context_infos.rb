class CreateSpeedupDashboardContextInfos < ActiveRecord::Migration
  def change
    create_table :speedup_dashboard_context_infos do |t|
      t.references :context, index: true #, foreign_key: true
      t.string :description
      t.float :duration
      t.datetime :time
      t.text :data

      t.timestamps null: false
    end
  end
end
