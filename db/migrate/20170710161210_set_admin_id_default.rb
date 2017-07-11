class SetAdminIdDefault < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :uuid, :uuid, default: "gen_random_uuid()", null: false

   change_table :admins do |t|
     t.remove :id
     t.rename :uuid, :id
   end
   execute "ALTER TABLE admins ADD PRIMARY KEY (id);"
  end
end
