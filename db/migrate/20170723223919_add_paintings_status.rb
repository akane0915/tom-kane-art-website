class AddPaintingsStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :paintings, :status, :integer, default: 0
  end
end
