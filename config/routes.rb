Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "dashboard#index"
  get "dashboard/about"
  get "admins/:id/dashboard" => "admins#dashboard"
  get "teachers/:id/dashboard" => "teachers#dashboard"
  get "students/:id/dashboard" => "students#dashboard"
  get "reading_sessions/new/:id" => "reading_sessions#new"
  get "donations/new/:type/:id" => "donations#new"

  resources :donations, only: [:new, :create]
  resources :schools, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :students, only: [:show, :new, :edit, :create, :update, :destroy] do
    collection { post :import }
  end
  resources :teachers, only: [:new, :edit, :create, :update, :destroy] do
    collection { post :import }
  end
  resources :reading_sessions, only: [:new, :edit, :create, :update, :destroy]
end
