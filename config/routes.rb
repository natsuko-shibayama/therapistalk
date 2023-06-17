Rails.application.routes.draw do
  devise_for :users
  root to: "talks#index"
  resources :users, only: [:show, :edit, :update]
  resources :talks do
    resources :comments, only: :create
  end
end
