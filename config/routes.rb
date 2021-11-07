Rails.application.routes.draw do
  devise_for :users
  # get 'reviews/index'
  root to: "reviews#index"
  resources :users, only: [:show, :edit, :update]
  resources :reviews, only: [:index, :new, :create, :show, :edit, :update]
end
