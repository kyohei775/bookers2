Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  resources :books, only: [:edit, :update, :create, :index, :show, :destroy]
  resources :users, only: [:edit,:show, :update, :create, :index]
  root to: 'homes#top'
  get "/home/about" => "homes#about"
end
