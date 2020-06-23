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

  #Route backoffice Admin
  get '/users', to: 'users#index'
  get '/users/change_status_admin', to: 'users#change_status_admin'
  get '/users/change_status_user', to: 'users#change_status_user'
  
  #Route poru la location
  get '/rent', to: 'movies#rent'
  get '/unrent', to: 'movies#unrent'
  get '/rent_show', to: 'movies#rent_show'

end
