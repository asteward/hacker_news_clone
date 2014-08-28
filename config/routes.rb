Rails.application.routes.draw do
  root 'posts#index'
  resources :comments do
    resources :comments
  end
  resources :posts do
    resources :votes
    resources :comments
  end
end
