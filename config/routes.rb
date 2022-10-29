Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  
  get "search" => "searches#search"
  
  
  resources :users, only: [:index,:show,:edit,:update]
  get "quit" => "users#quit"
  
  resources :scenarios, only: [:new, :create, :show, :edit, :update, :index, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :genres, only: [:index, :create, :edit, :update, :destroy]
  
end
