Rails.application.routes.draw do
  root 'static#index'
  get '/about', to: 'static#about'

  # Login/Logout
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  resources :users, except: [:new]

end
