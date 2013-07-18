class CreateAssortments < ActiveRecord::Migration
  def change
    create_table :assortments do |t|
      t.string :name
      t.integer :category_id
    end
  end
end
