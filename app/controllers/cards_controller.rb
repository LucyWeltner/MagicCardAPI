require 'open-uri'
require 'json'
class CardsController < ApplicationController
	def index
		cards = Card.all
		render json: cards
	end 

	def show
		card = Card.find_by_id(params[:id])
		render json: card 
	end

	def packs
		packs = []
		commons = filter_cards("common")
		uncommons = filter_cards("uncommon")
		rares = filter_cards("rare")
		rares.concat(filter_cards("mythic rare"))
		6.times do
			packs.push(make_pack({commons: commons, uncommons: uncommons, rares: rares}))
		end
		render json: packs 
	end 

	def decks
		decks = Deck.all 
		decks = decks.map{|deck| {name: deck.name, comments: deck.comments, cards: deck.cards}}
		render json: decks
	end

	# def spark
	# 	cards = open('https://api.scryfall.com/cards/search?order=cmc&q=e:war+-t:land').read
	# 	cards = JSON.parse(cards)
	# 	cards = cards["data"].map{|card|
	# 		{id: card["id"], name: card["name"], rarity: card["rarity"], cost: card["mana_cost"], set: card["set_name"], creature_type: card["type_line"], image_url: card["image_uris"]["normal"]}
	# 	}
	# 	render json: cards
	# end

	private
		def make_pack(cards) 
			pack = []
			10.times do 
				pack.push(cards[:commons][rand(cards[:commons].length)])
			end
			3.times do 
				pack.push(cards[:uncommons][rand(cards[:uncommons].length)])
			end
			pack.push(cards[:rares][rand(cards[:rares].length)])
			return pack 
		end

		def filter_cards(rarity_level)
			Card.all.select{|card| card.rarity == rarity_level}
		end
end