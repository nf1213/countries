Rails.application.routes.draw do
  root "countries#index"
  devise_for :users

  resources :countries do
    resources :cities do
      resources :reviews
    end
  end

end
