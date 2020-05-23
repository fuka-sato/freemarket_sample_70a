Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"
  resources :items
  resources :users, only: :index do
    collection do
      get :onestep
    end
  end

  resources  :items
  
end
