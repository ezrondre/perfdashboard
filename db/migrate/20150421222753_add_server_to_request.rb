class AddServerToRequest < ActiveRecord::Migration
  def change
    add_reference :speedup_dashboard_requests, :server, index: true #, foreign_key: true
  end
end
