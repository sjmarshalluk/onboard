Rails.application.routes.draw do

  resources :rooms
  resources :users
  root "rooms#index"

end
