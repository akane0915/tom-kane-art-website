Rails.application.routes.draw do
  resources :paintings, :about, :contact
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
