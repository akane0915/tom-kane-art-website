Rails.application.routes.draw do
  resources :paintings, :about
  get 'contact', to: 'messages#new', as: 'new_message'
  post 'contact', to: 'messages#create', as: 'create_message'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
