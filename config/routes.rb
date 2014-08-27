Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :votes
  end
end
