HipstaTrip::Application.routes.draw do

  devise_for :users

  root to: "trips#index"
  resources "trips", except: :new

end
