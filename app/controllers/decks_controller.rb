require 'pry'
class DecksController < ApplicationController 
	def index
		decks = Deck.all 
		decks = decks.map{|deck| {id: deck.id, name: deck.name, comments: deck.comments, cards: deck.cards}}
		render json: decks
	end

	def show
		deck = Deck.all.find_by_id(params[:id])
		if deck
			render json: {id: deck.id, name: deck.name, comments: deck.comments, cards: deck.cards}
		end
	end

	def create
		ok_params = params.permit(:name, :comments, cards: [:id])
		deck = Deck.create(name: ok_params[:name], comments: ok_params[:comments])
		ok_params[:cards].each{|card| CardInDeck.create(card_id: card["id"], deck_id: deck.id)}
		render json: {id: deck.id, name: deck.name, comments: deck.comments, cards: deck.cards}
	end
end