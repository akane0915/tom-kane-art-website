class RemoveChargesId < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :charge_id
  end
end
