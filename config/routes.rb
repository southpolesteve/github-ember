EmberIssues::Application.routes.draw do

  root 'home#index'

  match "/auth/github/callback" => "sessions#create", via: [:get, :post]

  get "/logout" => "sessions#destroy", :as => :logout

end
