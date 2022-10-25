Rails.application.routes.draw do
  get 'group/index'
  get 'group/new'
  get 'group/create'
  get 'group/group_params'
  get 'entities/index'
  get 'entities/new'
  devise_for :users

  # Defines the root path route ("/")
  #root "articles#index"
end
