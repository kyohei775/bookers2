Rails.application.routes.draw do
  resources :books, only: [:new, :create, :index, :show, :destroy]
  devise_for :users
  root to: 'homes#top'
end
