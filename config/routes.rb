Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :themes
  resources :themes do
    resources :answers, except: [:edit, :update]
  end
  resources :answers do
    resources :replies, only: [:new, :create]
  end
  get 'themes/home', to: 'themes#home'
  root 'themes#home'
end