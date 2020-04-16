class DeleteArtUrlFromCards < ActiveRecord::Migration[6.0]
  def change
  	remove_column :cards, :art_url
  end
end
