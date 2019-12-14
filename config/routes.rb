Rails.application.routes.draw do
  resources :line_items
  delete '/line_items/:id', to: 'line_items#destroy_from_cart', as: 'destroy_from_cart'

  resources :carts
  root 'store#index', as: 'store_index'
  

  
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
