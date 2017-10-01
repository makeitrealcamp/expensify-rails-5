Rails.application.routes.draw do
  resources :expenses, only: [:index]
  get '/dashboard', to: "dashboard#index"
  root "dashboard#index"
end
