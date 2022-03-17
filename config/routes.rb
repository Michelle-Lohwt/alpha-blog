Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  # The :articles refers to the articles controller
  resources :articles
end
