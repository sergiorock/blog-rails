Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Get es el método que se usa para obtener información
  # /welcome es la ruta que se usa para acceder a esa vista
  # to: indica el controlador y la acción que se va a ejecutar
  # home es el controller
  # index es el action

  get "/welcome", to: "home#index"

  root to: "home#index"

  get "articles", to: "articles#index"
  get "articles/new", to: "articles#new"
  get "articles/:id", to: "articles#show"
  get "articles/:id/edit", to: "articles#edit"
  
  post "articles", to: "articles#create"
  patch "articles/:id", to: "articles#update", as: :article

  delete "articles/:id", to: "articles#destroy"
end 