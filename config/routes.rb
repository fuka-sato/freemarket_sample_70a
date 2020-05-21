Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: :index do
    collection do
      get :onestep
      get :card
      get :logout
    end
  end
  # ↓バックエンド作業の際、usersにネストさせる！
  resources :creditcards, :new do
  end

end
