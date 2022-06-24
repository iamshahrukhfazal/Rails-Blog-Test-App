Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users



  resources :likes, only: [:create, :destroy]
  resources :reports, only: [:create, :destroy]


  resources :posts, shallow: true do
    resources :comments, only: [:create,:destroy]
    resources :suggestions
  end

  

  get "/reportedpost", to:"reports#all_reported_post"
  get "/reportedcomment", to:"reports#all_reported_comment"

  root to:'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
