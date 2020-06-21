Rails.application.routes.draw do

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "items#index"
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
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
    resources :shipping_addresses do
      collection do
        get :complete
      end
    end
  end
  # ↓バックエンド作業の際、usersにネストさせる！
  resources :creditcards, only: [:new, :show, :destroy, :create] do
  end

end
