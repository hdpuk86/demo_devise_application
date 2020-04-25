Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  root to: 'users#index'
end
