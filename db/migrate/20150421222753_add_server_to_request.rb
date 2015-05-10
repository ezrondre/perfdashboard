class AddServerToRequest < ActiveRecord::Migration
  def change
    add_reference :perfdashboard_requests, :server, index: true #, foreign_key: true
  end
end
