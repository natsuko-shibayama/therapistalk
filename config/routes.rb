Rails.application.routes.draw do
  get 'talks/index'
  root to: "talks#index"
end
