Rails.application.routes.draw do
  resources :characters
  resources :teams
  resources :users, only: [:create]
    post '/login', to: 'auth#create'
    post '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
