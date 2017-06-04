class CreatePaintings < ActiveRecord::Migration[5.1]
  def change
    create_table :paintings do |t|

      t.timestamps
    end
  end
end
