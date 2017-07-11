class AddPaperclipColumnToPaintings < ActiveRecord::Migration[5.1]
  def change
    add_attachment :paintings, :pclip_image
  end
end
