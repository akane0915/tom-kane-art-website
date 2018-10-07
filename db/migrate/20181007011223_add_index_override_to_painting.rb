class AddIndexOverrideToPainting < ActiveRecord::Migration[5.1]
  def change
    add_column :paintings, :index_override, :integer, default: 0
  end
end
