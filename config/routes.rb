Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations" }
  resources :events do
    resources :sign_ups
  end
  resources :users, only: [:show]
  

  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
