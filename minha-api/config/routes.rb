Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do

      post "/login", to: "auth#login"
      post "/register", to: "auth#register"

      get "/produtos", to: "produtos#index"
      post "/produtos", to: "produtos#create"
    end
  end
  # resources :produtos
end
