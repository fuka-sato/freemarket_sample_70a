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
      # get 'item_images'
    end
    member do
      get 'confirm'
    end
    resources :item_images
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
  resources :creditcards, :new do
  end

end
