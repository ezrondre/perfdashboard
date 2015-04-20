class CreatePerfdashboardContexts < ActiveRecord::Migration
  def change
    create_table :perfdashboard_contexts do |t|
      t.integer :context_uid
      t.string :type
      t.string :name
      t.references :request, index: true, foreign_key: true
      t.integer :context_data_count

      t.timestamps null: false
    end
  end
end
