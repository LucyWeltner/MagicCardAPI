Rails.application.routes.draw do
	get '/cards', to: 'cards#index'
	get '/cards/packs', to: 'cards#packs'
	get 'cards/new', to: 'cards#new'
	post '/cards/new', to: 'cards#create'
	get '/cards/next', to: 'cards#next'
	get '/cards/spark', to: 'cards#spark'
	get '/cards/:id', to: 'cards#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
