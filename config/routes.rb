Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'posts#index'

  resources :sessions
  resources :posts, only: :index

  resources :users do
    resources :posts, except: :index do
      resources :votes, only: :create
      resources :comments
    end
  end
end
