HipstaTrip::Application.routes.draw do

  get "comments/create"

  devise_for :users

  root to: "trips#index"

  resources "trips", except: :new do
    resources :proposals, only: %w[new create]
    resources :comments, only: :create
  end

  resources :proposals, only: [] do
    resource :accept, only: :create, controller: "proposal/accepts"
    resource :cancel, only: :create, controller: "proposal/cancels"
  end
end
