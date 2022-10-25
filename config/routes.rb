Rails.application.routes.draw do
  devise_for :users
  resources :group, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end
  root to: 'group#index'
  
  
  # Defines the root path route ("/")
  #root "articles#index"
end
