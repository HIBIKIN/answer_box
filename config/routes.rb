Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :themes
  resources :themes do
    resources :answers, except: [:edit, :update]
  end
  get '/themes/home', to: 'themes#home'
  post '/themes/:theme_id/answers/:id', to: 'answers#reply', as: :reply
  root 'themes#home'
end