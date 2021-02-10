Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'posts#index'
  resources :posts do
    collection do
      get 'top'
    end
    resources :users do
      resources :favorites, only: [:create, :destroy]
    end
  end 
  resources :person, only: [:show, :edit, :create, :update]
end
