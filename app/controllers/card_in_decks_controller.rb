class CardInDecksController < ApplicationController 
	def index 
		puts params
		cards_in_decks = CardInDeck.select{|card| card.deck_id == params[:deck_id].to_i}
		cards_in_decks = cards_in_decks.map{|card| {card_id: card.card_id, deck_id: card.deck_id}}
		render json: cards_in_decks
	end

	def show
		card_in_deck = CardInDeck.find_by({card_id: params[:id], deck_id: params[:deck_id]})
		card = Card.find_by_id(params[:id])
		deck = Deck.find_by_id(params[:deck_id])
		render json: {card_id: card_in_deck.card_id, name: card.name, set: card.set, deck_id: deck.id, deck_name: deck.name}
	end

	def delete 
		card_in_deck = CardInDeck.find_by({card_id: params[:id], deck_id: params[:deck_id]})
		card_in_deck.delete()
	end
end