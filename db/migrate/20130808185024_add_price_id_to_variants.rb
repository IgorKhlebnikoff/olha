class AddPriceIdToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :price_id, :integer
  end
end
