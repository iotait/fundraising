Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "dashboard#index"
  get "dashboard/about"
  get "dashboard/calculator"

  post "teachers/add_reading_session_for_class" => "teachers/add_reading_session_for_class"
  get "students/:id/dashboard" => "students#dashboard"
  get "reading_sessions/new/:id" => "reading_sessions#new"
  
  get "donations/new/:type/:id" => "donations#new"

  resources :admins, only: [] do
    get "/dashboard" => "admins#dashboard"
    get "/end_read_a_thon" => "admins#end_read_a_thon"
  end

  resources :donations, only: [:new, :create] do
  end

  resources :schools, only: [:show, :new, :edit, :create, :update, :destroy] do
  end

  resources :students, only: [:show, :new, :edit, :create, :update, :destroy] do
    get "/printable" => "students#printable"
    collection { post :import }
  end

  resources :teachers, only: [:new, :edit, :create, :update, :destroy] do
    get "dashboard" => "teachers#dashboard"
    collection { post :import }
  end

  resources :reading_sessions, only: [:new, :edit, :create, :update, :destroy] do
  end
end
