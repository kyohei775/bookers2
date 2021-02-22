Rails.application.routes.draw do
 
  root to: 'homes#top'
  get "/home/about" => "homes#about"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  
  resources :books, only: [:edit, :update, :create, :index, :show, :destroy]
  resources :users, only: [:edit,:show, :update, :create, :index]
  
end
