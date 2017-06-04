class CreatePaintings < ActiveRecord::Migration[5.1]
  def change
    enable_extension "pgcrypto"

    create_table :paintings, id: :uuid do |t|
      t.string :title
      t.date :creation_date
      t.string :description
      t.string :dimensions
      t.string :medium
      t.string :support
      t.boolean :framed
      t.decimal :price, precision: 12, scale: 2
      t.timestamps
    end
  end
end
