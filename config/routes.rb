Rails.application.routes.draw do
  root 'posts#index'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
