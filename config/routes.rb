Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  post 'cart_items/:id/add' => 'cart_items#add_quantity', as: 'cart_item_add'
  post 'cart_items/:id/reduce' => 'cart_items#reduce_quantity', as: 'cart_item_reduce'
  post 'cart_items' => 'cart_items#create'
  get 'cart_items/:id' => 'cart_items#show', as: 'cart_item'
  delete 'cart_items/:id' => 'cart_items#destroy'

  resources :users, only: %i[show edit update], path: 'profil'
  resources :items
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
