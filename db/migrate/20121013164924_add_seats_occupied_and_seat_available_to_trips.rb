class AddSeatsOccupiedAndSeatAvailableToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :seats_occupied, :integer
    add_column :trips, :seats, :integer
  end
end
