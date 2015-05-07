class CreatePerfdashboardRequests < ActiveRecord::Migration
  def change
    create_table :perfdashboard_requests do |t|
      t.string :request_uid
      t.datetime :time
      t.float :duration
      t.string :controller
      t.string :action
      t.text :path
      t.boolean :error, default: false
      t.boolean :xhr, default: false
      t.string :format, default: 'html'
      t.float :view_duration
      t.float :db_duration

      t.timestamps null: false
    end
  end
end
