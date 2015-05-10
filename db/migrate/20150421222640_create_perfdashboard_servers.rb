class CreatePerfdashboardServers < ActiveRecord::Migration
  def change
    create_table :perfdashboard_servers do |t|
      t.string :name
      t.string :api_key
      t.string :host

      t.timestamps null: false
    end
  end
end
