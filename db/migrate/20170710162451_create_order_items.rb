class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items, id: :uuid do |t|
      t.integer :quantity
      t.uuid :painting_id
      t.uuid :order_id
      t.timestamps
    end
  end
end
