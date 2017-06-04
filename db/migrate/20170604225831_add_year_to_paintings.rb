class AddYearToPaintings < ActiveRecord::Migration[5.1]
  def change
    add_column :paintings, :year, :string
    remove_column :paintings, :creation_date, :date
  end
end
