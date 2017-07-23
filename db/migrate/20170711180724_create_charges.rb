class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.uuid :order_id
      
      t.timestamps
    end
  end
end
