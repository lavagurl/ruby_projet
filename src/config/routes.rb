Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts # localhost:3000/posts

  #Route / ou /home
  get '/home', '/', to: 'home#index'
  
  #Route pour les films
  get '/movies', to: 'movies#index'
  get '/movies/add', to: 'movies/add'
  get '/movies/show', to: 'movies/show'

  
end
