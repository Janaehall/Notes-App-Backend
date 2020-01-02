Rails.application.routes.draw do
  resources :messages
  # resources :users
  get '/users', to: 'users#index'
  get '/users/:name', to: 'users#show' 
  post '/users', to: 'users#create'
  resources :notes
  resources :tags
  resources :note_tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
