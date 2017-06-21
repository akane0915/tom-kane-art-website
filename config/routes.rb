Rails.application.routes.draw do



  resources :paintings, :about, :privacy_policy


  get 'details/index'


  get 'contact', to: 'messages#new', as: 'new_message'
  post 'contact', to: 'messages#create', as: 'create_message'

  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index', as: 'home'
end
