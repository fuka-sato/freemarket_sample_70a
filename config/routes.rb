Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: "items#index"
  resources :items do
    member do
      get 'confirm'
    end
  end
  
  resources :users do
    collection do
      get :onestep
    end
  end

  resources  :items
  
end
