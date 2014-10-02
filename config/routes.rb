Rails.application.routes.draw do

  get 'rooms/index'

  get 'rooms/show'

  get 'rooms/new'

  get 'rooms/edit'

  resources :rooms
  root "rooms#index"

end
