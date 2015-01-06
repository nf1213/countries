Rails.application.routes.draw do
  root "countries#index"
  devise_for :users

  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  resources :countries, only: [:index, :show] do
    resources :cities, only: [:index, :show] do
      resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
  end

  resources :votes, only: [:create, :update]

end
