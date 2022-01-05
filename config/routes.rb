Rails.application.routes.draw do
  get 'homes/about'
  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:new, :create, :index, :show, :edit,]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
