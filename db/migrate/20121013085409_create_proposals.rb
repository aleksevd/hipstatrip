class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.belongs_to :sender
      t.belongs_to :receiver

      t.integer :state

      t.timestamps
    end
  end
end
