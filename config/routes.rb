Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'posts#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: :index

  resources :users, only: [:new, :create] do
    resources :posts, only: [:new, :create, :show] do
      resources :votes, only: :create
      resources :comments, only: [:new, :create]
    end
  end
end
