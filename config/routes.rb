Rails.application.routes.draw do
  devise_for :users



  resources :likes, only: [:create, :destroy]
  resources :reports, only: [:create, :destroy]


  resources :posts do
    resources :comments, only: [:create]
  end

  
  root to:'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
