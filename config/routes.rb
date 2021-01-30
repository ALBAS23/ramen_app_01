Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    collection do
      get 'top'
    end
  end 
  resources :person, only: [:show, :edit]
end
