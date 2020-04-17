class DecksController < ApplicationController 
	def index
		decks = Deck.all 
		decks = decks.map{|deck| {name: deck.name, comments: deck.comments, cards: deck.cards}}
		render json: decks
	end

	def create
		Deck.create(params.permit(:name, :comments, :cards))
	end
end