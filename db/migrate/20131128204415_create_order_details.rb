class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :item_qty

      t.timestamps
    end
  end
end