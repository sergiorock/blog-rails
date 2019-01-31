Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :comments
  resources :articles
  
end
