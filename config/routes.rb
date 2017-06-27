Rails.application.routes.draw do

  root 'home#index', as: 'home'

  resources :paintings
  resources :privacy_policy, :about, only: [:index]
  resources :details, only: [:show, :index]

  # consider resource when reworking
  get 'contact', to: 'messages#new', as: 'new_message'
  post 'contact', to: 'messages#create', as: 'create_message'

end
