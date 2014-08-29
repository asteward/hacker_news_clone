Rails.application.routes.draw do
  root 'posts#index'
  resources :users
  resources :posts do
    resources :votes
    resources :comments
  end
end
