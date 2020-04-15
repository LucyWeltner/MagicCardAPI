class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :image_url
      t.string :art_url
      t.text :flavor_text
      t.string :rarity
      t.integer :cost
      t.string :type
      t.string :set

      t.timestamps
    end
  end
end