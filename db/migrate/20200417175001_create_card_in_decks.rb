class CreateCardInDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :card_in_decks do |t|
      t.integer :deck_id
      t.integer :card_id

      t.timestamps
    end
  end
end
