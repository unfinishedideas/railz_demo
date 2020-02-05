Rails.application.routes.draw do
  root to: 'spots#index'
  post 'user_token' => 'user_token#create'
  post 'super_user_token' => 'super_user_token#create'
  post 'admin_token' => 'admin_token#create'

  root to: 'pages#home'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :spots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
