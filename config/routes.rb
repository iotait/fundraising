Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "dashboard#index"
  get "dashboard/about"
  get "dashboard/user"
  resources :donations, only: [:new, :create]
  resources :students, only: [:show, :new, :create, :destroy]
  # resources :teachers
  resources :schools, only: [:show, :new, :edit, :create, :update, :destroy]
end
