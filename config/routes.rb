Rails.application.routes.draw do
  
  resources :passwords, param: :token
  resources :users, only: [:create, :show, :edit, :update]

  get "sign_up", to: "users#new", as: "sign_up"
  get "login", to: "session#new", as: "login"
  post "login", to: "session#create"
  delete "logout", to: "session#destroy", as: "logout"
  root "memos#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :memos, only: [:index, :create, :show, :edit, :update, :destroy]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
