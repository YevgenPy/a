Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get 'search', to: 'search#search'

  resources :posts do
    resources :comments
  end

end
