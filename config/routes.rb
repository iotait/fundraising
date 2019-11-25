Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/about"
  resources :donations, only: [:index, :new, :create, :show]
  resources :students
  resources :teachers
  resources :schools
  resources :admins
end
