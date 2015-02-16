class AddPriceToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :price, :float
  end
end
