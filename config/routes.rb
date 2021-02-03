Rails.application.routes.draw do

  get 'home/top'
  get 'home/about'
  devise_for :users
  root to: "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do 
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
end