Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'posts#index'
  resources :posts do
    collection do
      get 'top'
      get 'search'
    end
    resources :users do
      resources :favorites, only: [:create, :destroy]
    end
  end 
  resources :person, only: [:show, :edit, :create, :update] do
    resources  :favorites, only: :index
    member do
      get 'mypost'
    end
  end
end
