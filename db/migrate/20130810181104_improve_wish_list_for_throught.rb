class ImproveWishListForThrought < ActiveRecord::Migration
  def change
    remove_column :wish_lists, :variant_id
    remove_column :wish_lists, :created_at
    remove_column :wish_lists, :updated_at

    add_column :wish_lists, :wish_id, :integer
  end
end
