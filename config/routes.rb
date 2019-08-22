Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :themes
  root 'themes#index'

end
