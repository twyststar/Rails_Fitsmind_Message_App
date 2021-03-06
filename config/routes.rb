Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "home#welcome"

  devise_for :users
  resources :users, only: [:show]
  resources :home, :only => [:welcome, :index]
  resources :conversations, :only => [ :show]
  resources :messages, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
