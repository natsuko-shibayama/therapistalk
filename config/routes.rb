Rails.application.routes.draw do
  devise_for :users
  root to: "talks#index"
  resources :users, only: [:show, :edit, :update]
  resources :talks, only:[:new, :create, :show, :edit, :update, :destroy]
end
