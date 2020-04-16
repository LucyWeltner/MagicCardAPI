class DeleteFlavorTextFromCards < ActiveRecord::Migration[6.0]
  def change
  	remove_column :cards, :flavor_text
  end
end
