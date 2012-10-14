class AddGeoLocationsToTrip < ActiveRecord::Migration
  def change
    remove_column :trips, :start_latitude
    remove_column :trips, :start_longitude
    remove_column :trips, :end_latitude
    remove_column :trips, :end_longitude

    add_column :trips, :origin, :point, :geographic => true
    add_column :trips, :destination, :point, :geographic => true
  end
end
