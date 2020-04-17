class DecksController < ApplicationController 
	def index
		decks = Deck.all 
		decks = decks.map{|deck| {name: deck.name, comments: deck.comments, cards: deck.cards}}
		render json: decks
	end

	def create
		deck = Deck.create(params.permit(:name, :comments, :cards))
		puts params[:cards]
		params[:cards].each{|card| CardInDeck.create(card_id: card["id"], deck_id: deck.id)}
		render json: {id: deck.id, name: deck.name, comments: deck.comments, cards: deck.cards}
	end
end