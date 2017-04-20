Rails.application.routes.draw do
  root "dashboard#index"

  resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenses, only: [:index, :create, :update, :destroy]
    end
  end
end
