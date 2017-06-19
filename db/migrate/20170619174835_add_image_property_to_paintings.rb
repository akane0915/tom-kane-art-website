class AddImagePropertyToPaintings < ActiveRecord::Migration[5.1]
  def change
    add_column :paintings, :image, :string
  end
end
