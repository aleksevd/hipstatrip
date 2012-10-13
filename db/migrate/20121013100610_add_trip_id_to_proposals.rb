class AddTripIdToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :trip_id, :integer
  end
end
