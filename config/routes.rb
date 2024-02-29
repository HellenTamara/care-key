Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


  get "/home", to: "pages#home", as: :home
  get "/goals/dashboard", to: "goals#dashboard", as: :dashboard


  # get "/avatar/edit", to: "pages#edit", as: :edit_avatar
  # patch "/avatar", to: "pages#update"
  resources :avatars, only: [:edit, :update]
  resources :goals, only: [:new, :create, :index] do
    resources :submissions, only: [:create, :index]
  end
end
