class ChangeOrderitemColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_items, :product_id, :string
    add_column :order_items, :order_id, :string
  end
end
