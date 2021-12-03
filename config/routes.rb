Rails.application.routes.draw do
  namespace :manager do
      resources :users
      resources :admins
      resources :students
      resources :teachers
      resources :donations
      resources :reading_sessions
      resources :schools

      root to: "users#index"
    end
  devise_for :users, controllers: {registrations: "registrations"}
  root "dashboard#index"

  mount StripeEvent::Engine, at: "/successful_charge"

  namespace :dashboard do
    get "about"
    get "calculator"
  end

  resources :admins, only: [] do
    get "dashboard"
    get "end_read_a_thon"
    get "promote"
    get "reports"
    get "school"
    get "students_csv"
    get "students"
    collection do
      post "student_search"
    end
    get "teacher_id_pdf"
    get "teachers_csv"
    get "teachers"
    get "teacher_printable"
  end

  resources :schools, only: [:show, :new, :edit, :create, :update, :destroy] do
    get "success"

    resources :donations, only: [:create] do
    end
  end

  resources :students, only: [:show, :new, :edit, :create, :update, :destroy] do
    collection { post :import }
    get "success"
    get "dashboard"
    get "printable"

    resources :donations, only: [:create] do
    end

    resources :reading_sessions, only: [:new, :edit, :create, :update, :destroy] do
    end
  end

  resources :teachers, only: [:new, :edit, :create, :update, :destroy] do
    collection { post :import }
    post "add_reading_session_for_class"
    get "dashboard"
    get "promote"
    get "students"
    get "class_printable"
    get "printable"
  end
end
