Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  get 'order/success' => 'orders#success', as: 'order_success'
  get 'order/cancel' => 'order#cancel', as: 'order_cancel'

  resources :users, only: %i[show edit update], path: 'profil'
  resources :cart_items
  resources :items
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
