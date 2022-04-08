Rails.application.routes.draw do
  get 'newsletters/create'
  devise_for :users
  root 'pages#index'

  resources :newsletters
  resources :posts do
    resources :comments
  end

end
