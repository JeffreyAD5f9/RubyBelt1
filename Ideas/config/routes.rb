Rails.application.routes.draw do
  get '/' => 'users#new'
  post '/users' => 'users#create'
  get '/users/logout' => 'users#logout'
  get 'users/:id' => 'users#display'

  post '/sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'

  get '/ideas' => 'ideas#index'
  get 'ideas/:id' => 'ideas#display'
  post '/ideas' => 'ideas#create'
  delete 'ideas/:id' => 'ideas#destroy'

  post '/likes/:id' => 'likes#create'
  delete '/likes/:id' => 'likes#destroy'
end
