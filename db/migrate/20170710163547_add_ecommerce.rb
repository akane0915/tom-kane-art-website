class AddEcommerce < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :status
      t.decimal :total_price
      t.timestamps
    end

    create_table :order_items, id: :uuid do |t|
      t.string :painting_id
      t.string :product_id
      t.timestamps
    end
  end
end
