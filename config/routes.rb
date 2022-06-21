Rails.application.routes.draw do
  root to:'pages#home'
  resources :posts do
    resources :comments, only: [:create]
  end

  resources :likes, only: [:create, :destroy]
  devise_for :users

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
