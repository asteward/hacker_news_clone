Rails.application.routes.draw do
  root 'posts#index'
  resources :sessions
  resources :users
  resources :posts do
    resources :votes
    resources :comments
  end
end
