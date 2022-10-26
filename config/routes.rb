Rails.application.routes.draw do
  devise_for :users
  resources :group, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create, :index_transaction, 
      :new_transaction, :create_transaction]
  end
  root to: 'group#index'

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  
  
  # Defines the root path route ("/")
  #root "articles#index"
end
