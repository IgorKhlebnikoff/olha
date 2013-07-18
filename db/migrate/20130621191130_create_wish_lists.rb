class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.integer :user_id
      t.integer :variant_id
      t.timestamps
    end
  end
end
