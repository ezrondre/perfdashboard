class CreateSpeedupDashboardServers < ActiveRecord::Migration
  def change
    create_table :speedup_dashboard_servers do |t|
      t.string :name
      t.string :api_key
      t.string :host

      t.timestamps null: false
    end
  end
end
