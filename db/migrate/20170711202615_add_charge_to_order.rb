class AddChargeToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :charge_id, :uuid
  end
end
