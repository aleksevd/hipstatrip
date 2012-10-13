class RenameUserIdInPassangersTrip < ActiveRecord::Migration
  def change
    rename_column :passengers_trips, :user_id, :passenger_id
  end
end
