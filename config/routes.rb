Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/about"
  resources :donations, only: [:index, :new, :create]
  resources :students, only: [:index, :new, :create]
end
