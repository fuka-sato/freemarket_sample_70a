Rails.application.routes.draw do

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "items#index"
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'done'
      get 'update_done'
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      post 'payment'
      get 'purchased'
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

  resources :orders do
  end

  
  # ↓バックエンド作業の際、usersにネストさせる！
  resources :creditcards, only: [:new, :show, :destroy, :create] do
  end

  resources :payments, only: [:new, :show, :create] do
  end

end
