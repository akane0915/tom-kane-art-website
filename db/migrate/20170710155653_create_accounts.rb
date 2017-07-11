class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts, id: :uuid do |t|
      t.uuid :admin_id
      t.timestamps
    end
    add_column :admins, :account_id, :uuid
  end
end
