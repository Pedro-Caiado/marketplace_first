Rails.application.routes.draw do
  resources :products
  devise_for :users, controller: {
    registrations: 'registrations'
  }
  root 'products#index'
end
