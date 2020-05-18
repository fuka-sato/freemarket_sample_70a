Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    collection do
      get 'confirm'
    end
  end
  
  resources :users, only: :index do
    collection do
      get :onestep
    end
  end
end
