Rails.application.routes.draw do
  root "countries#index"
  devise_for :users

  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :admin, only: [:index]

  namespace :admin do
    # roots 'Admin::cities#index'
    resources :cities do
      resources :reviews, only: [:index, :show, :destroy]
    end
    resources :users, only: [:index, :show, :destroy]
  end

  resources :countries, only: [:index, :show] do
    resources :cities, only: [:index, :show] do
      resources :reviews
    end
  end

  resources :votes, only: [:create, :update]

end
