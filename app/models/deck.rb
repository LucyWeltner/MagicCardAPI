class Deck < ApplicationRecord
	has_many :card_in_decks
	has_many :cards, through: :card_in_decks
end
