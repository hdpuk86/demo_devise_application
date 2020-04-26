Rails.application.routes.draw do
  devise_for :users, path: '', # NOTE remove user scope prevents clashing routes with user controller
    sign_out_via: :get # NOTE can also be set in devise.rb:257 config.sign_out_via = :delete

  resources :users, only: [:index, :show, :edit, :update] # NOTE must come after devise_for
  root to: 'users#index'
end
