Rails.application.routes.draw do
  root "countries#index"
  devise_for :users

  resources :countries, only: [:index, :show] do
    resources :cities, only: [:index, :show] do
      resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
  end

end
