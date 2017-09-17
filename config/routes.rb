Rails.application.routes.draw do

  devise_for :admins, skip: :registrations

  root 'home#index', as: 'home'

  resources :admins
  resources :paintings
  resources :privacy_policy, :about, only: [:index]
  resources :details, only: [:show]
  resources :order_items
  resources :charges, only: [:new, :create]

  resource :cart, only: [:show]

  # consider resource when reworking
  # resources :contact, only: [:show, :index]
  get 'contact', to: 'messages#new', as: 'new_message'
  post 'contact', to: 'messages#create', as: 'create_message'

  get 'thanks', to: 'charges#thanks', as: 'thanks'

  get 'charges/review', to: 'charges#review', as: 'review_order'
  post 'charges/review', to: 'charges#submit', as: 'submit_order'

  if Rails.env.production?
    get '404', to: 'home#unknown'
  end
end
