Rails.application.routes.draw do

  devise_for :admins

  root 'home#index', as: 'home'

  resources :paintings
  resources :privacy_policy, :about, only: [:index]
  resources :details, only: [:show]
  resources :order_items
  resources :charges, only: [:new, :create]
  
  resource :cart, only: [:show]

  # consider resource when reworking
  get 'contact', to: 'messages#new', as: 'new_message'
  post 'contact', to: 'messages#create', as: 'create_message'

  get 'thanks', to: 'charges#thanks', as: 'thanks'

end
