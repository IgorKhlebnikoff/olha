class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.integer :user_id
      t.integer :order_id
      t.timestamps
    end
  end
end
