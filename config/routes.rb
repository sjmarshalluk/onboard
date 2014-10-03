Rails.application.routes.draw do

  get 'users/new'

  resources :rooms
  resources :users
  root "rooms#index"

end
