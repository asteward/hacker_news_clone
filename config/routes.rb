Rails.application.routes.draw do
  root 'posts#index'
  
  resources :posts do
    resources :votes
    resources :comments
  end
end
