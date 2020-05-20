Rails.application.routes.draw do
  resources :products

  resources :carts do
    collection do
      get 'add'
      get 'remove'
      get 'finish'
    end
  end

  devise_for :users
  root 'products#index'
end
