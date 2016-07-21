Rails.application.routes.draw do
  root 'friends#index'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
