Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index,:show, :create]
    end
  end
  
  get 'search', to: 'search#search'
  resources :posts do
    resources :comments
  end
end
