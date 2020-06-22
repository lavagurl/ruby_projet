Rails.application.routes.draw do
  resources :movies
  devise_for :users
  resources :categories
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts # localhost:3000/posts

  #Routes gestion erreur
  get '/errors', to: 'errors#index'

  #Route / ou /home
  get '/home', '/', to: 'home#index'

  #Route pour les films
  #get '/movies', to: 'movies#index'
  #get '/movies/new', to: 'movies#new'
  #get '/movies/show', to: 'movies#show'

  #Route backoffice Admin
  get '/users', to: 'users#index'

end
