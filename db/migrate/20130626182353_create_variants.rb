class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :product_id
      t.integer :color_id
      t.integer :size_id
      t.boolean :in_stock
      t.integer :quantity
      t.timestamps
    end
  end
end
