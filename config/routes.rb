Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :themes
  resources :themes do
    resources :answers, except: [:show, :edit, :update]
  end
  root 'themes#index'

end
