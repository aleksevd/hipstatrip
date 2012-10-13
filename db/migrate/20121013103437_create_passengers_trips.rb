class CreatePassengersTrips < ActiveRecord::Migration
  def change
    create_table :passengers_trips do |t|
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
