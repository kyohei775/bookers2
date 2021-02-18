Rails.application.routes.draw do
  get 'users/show'
  resources :books, only: [:edit, :update, :new, :create, :index, :show, :destroy]
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:edit,:show, :update]
  
  end
