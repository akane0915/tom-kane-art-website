class ChargeOrderNotNil < ActiveRecord::Migration[5.1]
  def change
    remove_column :charges, :order_id
    add_column :charges, :order_id, :uuid, null: false
  end
end
