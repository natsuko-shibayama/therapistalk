Rails.application.routes.draw do
  devise_for :users
  get 'talks/index'
  root to: "talks#index"
end
