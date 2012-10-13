class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :driver_id
      t.datetime :starts_at

      t.timestamps
    end
  end
end
