Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  resources :users, only: [:index, :show]

  root 'categories#index'
end
