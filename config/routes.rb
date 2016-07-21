Rails.application.routes.draw do
  root 'friends#index'

  get '/auth/:provider/callback' => 'sessions#create'
end
