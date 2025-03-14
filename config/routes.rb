Rails.application.routes.draw do
  resource :session
  resource :registration, only: %i[new create]
  resources :passwords, param: :token
  resources :profiles do
    resources :instruments, only: %i[index show update]
    ############################################################
    # This entity is not used anymore, but we keep it here for reference
    # resources :influences, only: %i[index show]
    ############################################################
    get "styles", to: "musical_styles#index"
  end

  get "jams" => "jams#index", as: :jams
  get "jams/new" => "jams#new", as: :new_jam
  get "jams/:id" => "jams#show", as: :jam
  post "jams" => "jams#create", as: :create_jam
  get "jams/:id/edit" => "jams#edit", as: :edit_jam
  patch "jams/:id" => "jams#update", as: :update_jam
  delete "jams/:id" => "jams#destroy", as: :destroy_jam

  get "search" => "search#index"
  get "search/results" => "search#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker"

  # Defines the root path route ("/")
  root "home#index"
end
