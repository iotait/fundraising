Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root "dashboard#index"

  namespace :dashboard do
    get "about"
    get "calculator"
  end

  mount StripeEvent::Engine, at: "/successful_charge"

  resources :admins, only: [] do
    get "dashboard"
    get "end_read_a_thon"
  end

  resources :schools, only: [:show, :new, :edit, :create, :update, :destroy] do
    resources :donations, only: [:create] do
    end
  end

  resources :students, only: [:show, :new, :edit, :create, :update, :destroy] do
    get "dashboard"
    get "printable"
    collection { post :import }

    resources :reading_sessions, only: [:new, :edit, :create, :update, :destroy] do
    end

    resources :donations, only: [:create] do
    end
  end

  resources :teachers, only: [:new, :edit, :create, :update, :destroy] do
    get "dashboard"
    post "add_reading_session_for_class"
    collection { post :import }
  end
end
