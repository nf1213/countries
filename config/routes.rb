Rails.application.routes.draw do
  root 'cities#index'
  devise_for :users

  resources :countries do
    resources :cities do
      resources :reviews
    end
  end

end
