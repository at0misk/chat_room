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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
