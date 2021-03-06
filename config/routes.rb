Rails.application.routes.draw do

	root 'posts#index'

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

	resources :users, only: [:new, :create]

	resources :posts do
	  resources :comments, only: [:create]
	end

	# get '/posts', to: 'posts#index'
	# get '/posts/new', to: 'posts#new', as: 'new_post'
	# post '/posts', to: 'posts#create'
	# get '/posts/:id', to: 'posts#show', as: 'post'
	# get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'
	# patch '/posts/:id', to: 'posts#update'
	# delete '/posts/:id', to: 'posts#destroy'

end
