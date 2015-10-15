Rails.application.routes.draw do
  
  # devise
  devise_ios_rails_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    post 'auth/facebook', to: 'devise_ios_rails/oauth#facebook'
  end

  # static pages
  root to: 'thoughtrecords#index'
  get '/about', to: 'static#about'
  get '/contact', to: 'static#contact'

  resources :thoughtrecords, except: [:show, :index]

  namespace :api, constraints: { subdomain: 'api' } do
    resources :thoughtrecords, except: [:new, :edit]
  end

end
