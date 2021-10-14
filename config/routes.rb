Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :users, only: [:show]
  resources :sign_ups

  root "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "events/:id"   => "events#rsvp"
end
