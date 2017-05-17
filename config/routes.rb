Rails.application.routes.draw do
	root 'sessions#landing'
	post '/users/create' => 'users#create'
	get '/chatroom' => 'sessions#chatroom'
	post '/sessions/create' => 'sessions#create'
	post '/topics/create' => 'topics#create'
	get '/topics/:id' => 'topics#view'
	post '/messages/create' => 'messages#create'
	post '/topics/destroy' => 'topics#destroy'
 	mount ActionCable.server => '/cable'
 	get '/logout' => 'sessions#logout'
 	get '/chatroom_admin' => 'sessions#chatroom_admin'
 	get '/about' => 'sessions#about'
 	get '/contact' => 'sessions#contact'
 	get '/categories' => 'categories#all'
 	get '/categories/new' => 'categories#new'
 	post '/category/create' => 'categories#create'
 	get '/categories/:id' => 'categories#view'
 	post '/categories/destroy' => 'categories#destroy'
 	get '/users/edit' => 'users#edit'
 	patch '/users/edit' => 'users#update'
 	get '/videos' => 'videos#index'
 	get '/videos/new' => 'videos#new'
 	post '/videos' => 'videos#create'
 	get '/videos/:id' => 'videos#categories_view'
 	get '/blog' => 'blogs#view'
 	get '/resources' => 'sessions#resources'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
