Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'items#index'

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  get 'order/success' => 'orders#success', as: 'order_success'
  get 'order/cancel' => 'orders#cancel', as: 'order_cancel'
  get 'orders/admin_index' => 'orders#admin_index'

  resources :users, only: %i[show edit update], path: 'profil'
  resources :cart_items
  resources :items
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
