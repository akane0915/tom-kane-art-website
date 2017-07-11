class SchemaFix < ActiveRecord::Migration[5.1]
  def change
    drop_table :accounts
    remove_column :admins, :account_id
    remove_column :orders, :account_id
  end
end
