class CreateOrdersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :status
      t.uuid :account_id
      t.decimal :total_price, precision: 12, scale: 2
      t.integer :order_number
      t.decimal :shipping, precision: 12, scale: 2
      t.decimal :subtotal, precision: 12, scale: 2
      t.decimal :tax, precision: 12, scale: 2

      t.timestamps
    end
  end
end
