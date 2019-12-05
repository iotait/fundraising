Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "dashboard#index"
  get "dashboard/about"
  get "admins/dashboard"
  get "teachers/dashboard"
  get "students/dashboard"
  resources :donations, only: [:new, :create]
  resources :schools, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :students, only: [:show, :new, :create, :destroy] do
    collection { post :import }
  end
  resources :teachers, only: [:new, :edit, :create, :update, :destroy] do
    collection { post :import }
  end
  resources :reading_sessions, only: [:new, :edit, :create, :update, :destroy]
end
