Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :brand

  resources :pic

  # resources :waste

  resources :id

  resources :users

  resources :coupons

  resource :brands

  	# log in page with form:
	get '/login'     => 'sessions#new'

	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'

	# delete action to log out:
  post '/logout' => 'sessions#destroy'
  
  get '/brands/login'     => 'brand_sessions#new'

	# create (post) action for when log in form is submitted:
	post '/brands/login'    => 'brand_sessions#create'

	# delete action to log out:
  post '/brands/logout' => 'brand_sessions#destroy'
  
  get '/brands/coupons' => 'brands/coupons#index'

  post '/brands/coupons' => 'brands/coupons#new'

  delete '/brands/coupons' => 'brands/coupons#destroy'

end
