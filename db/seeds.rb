# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cards = open('https://api.scryfall.com/cards/search?order=cmc&q=e:war+-t:land').read
cards = JSON.parse(cards)
cards = cards["data"].map{|card|
	{id: card["id"], name: card["name"], rarity: card["rarity"], cost: card["mana_cost"], set: card["set_name"], creature_type: card["type_line"], image_url: card["image_uris"]["normal"]}
}
cards.forEach{|card| Card.create(card)}
render json: cards