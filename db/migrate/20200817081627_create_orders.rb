class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :receive_postal_code, null: false
      t.string :receive_address, null: false
      t.string :receive_name, null: false
      t.integer :total_amount, null: false
      t.integer :how_pay, null: false
      t.integer :postage, null: false, default: 800
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
