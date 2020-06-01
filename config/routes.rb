Rails.application.routes.draw do

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  # devise_scope :user do
  #   get 'addresses', to: 'users/registrations#new_shipping_address'
  #   post 'addresses', to: 'users/registrations#create_address'
  #   get 'complete', to: 'users/registrations#complete'
  # end

  root to: "items#index"
  resources :items do
    member do
      get 'confirm'
    end
  end
  
  resources :users do
    collection do
      get :onestep
      get :card
      get :logout
    end
    resources :shipping_addresses  do
      collection do
        get :complete
      end
    end
  end

  # ↓バックエンド作業の際、usersにネストさせる！
  resources :creditcards, :new do
  end

  
end
