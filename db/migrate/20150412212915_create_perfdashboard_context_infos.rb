class CreatePerfdashboardContextInfos < ActiveRecord::Migration
  def change
    create_table :perfdashboard_context_infos do |t|
      t.references :context, index: true #, foreign_key: true
      t.string :description
      t.float :duration
      t.datetime :time
      t.text :data

      t.timestamps null: false
    end
  end
end
