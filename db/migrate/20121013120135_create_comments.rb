class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :owner_id
      t.string :owner_type

      t.timestamps
    end
  end
end
