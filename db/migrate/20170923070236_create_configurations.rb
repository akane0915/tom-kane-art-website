class CreateConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :configurations, id: :uuid do |t|
      t.decimal "shipping_fee", precision: 12, scale: 2
      t.timestamps
    end
  end
end
