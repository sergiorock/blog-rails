Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :articles do
    resources :comments, only: [:create, :update, :destroy]
  end
  
end
