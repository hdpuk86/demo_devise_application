Rails.application.routes.draw do
  devise_for :users, path_prefix: 'auth' # prefix prevents clashing routes with user controller

  devise_scope :user do # custom routes to allow get requests
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :users, only: [:index, :show, :edit, :update] # must come after devise_for
  root to: 'users#index' # must have a root
end
