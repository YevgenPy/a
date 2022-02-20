Rails.application.routes.draw do
  root 'pages#index'


  resources :posts do
    resources :comments
  end

end
