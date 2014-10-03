Rails.application.routes.draw do


	# sessions gets singular resource as there can only ever be one session
	resource :session
  	resources :rooms, except: [:new, :create] do
  		resources :orders, only: [:new, :create]
  	end
  	resources :users do
  		# this is for passing through user id when creating room
  		resources :rooms, only: [:new, :create]
  		resources :orders, only: [:show]
  	end
  	root "rooms#index"

end
