Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "index", to: "articles#index"
  get "delete", to: "articles#delete"
  resources :articles
end
