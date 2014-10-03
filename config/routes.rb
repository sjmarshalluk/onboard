Rails.application.routes.draw do

	# sessions gets singular resource as there can only ever be one session
	resource :session
  	resources :rooms
  	resources :users
  	root "rooms#index"

end
