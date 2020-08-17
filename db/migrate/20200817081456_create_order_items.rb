class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :after_price, null: false
      t.integer :qty, null: false
      t.integer :made_status, null: false, default: 0

      t.timestamps
    end
  end
end
