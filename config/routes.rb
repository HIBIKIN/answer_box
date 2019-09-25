Rails.application.routes.draw do
  resources :replies
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :themes
  resources :themes do
    resources :answers, except: [:edit, :update]
  end
  resources :answers do
    resources :reply, only: [:create, :show]
  end
  get 'themes/home', to: 'themes#home'
  root 'themes#home'
end