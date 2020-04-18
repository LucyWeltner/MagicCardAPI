Rails.application.routes.draw do
	get '/cards', to: 'cards#index'
	get '/cards/packs', to: 'cards#packs'
	get 'cards/new', to: 'cards#new'
	post '/cards/new', to: 'cards#create'
	get '/cards/next', to: 'cards#next'
	get '/cards/:id', to: 'cards#show'
	get '/decks', to: 'decks#index'
	post '/decks', to: 'decks#create'
	get '/decks/:id', to: 'decks#show'
	resources :decks do
		resources :card_in_decks
	end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
