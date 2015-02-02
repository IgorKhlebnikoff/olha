class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :amount
      t.integer :currency_id
      t.timestamps
    end
  end
end
