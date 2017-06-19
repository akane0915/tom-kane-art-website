class AddStyle < ActiveRecord::Migration[5.1]
  def change
    add_column :paintings, :style, :string
  end
end
