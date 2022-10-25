Rails.application.routes.draw do
  get 'entities/index'
  get 'entities/new'
  devise_for :users

  # Defines the root path route ("/")
  #root "articles#index"
end
