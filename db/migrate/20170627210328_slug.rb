class Slug < ActiveRecord::Migration[5.1]
  def change
    add_column :paintings, :slug, :string
  end
end
