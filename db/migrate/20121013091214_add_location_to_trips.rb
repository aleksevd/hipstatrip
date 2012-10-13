class AddLocationToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :start_address, :string
    add_column :trips, :end_address, :string
    add_column :trips, :start_latitude, :float
    add_column :trips, :start_longitude, :float
    add_column :trips, :end_latitude, :float
    add_column :trips, :end_longitude, :float
  end
end
