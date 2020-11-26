Rails.application.routes.draw do
  devise_for :users
  root to: 'animes#index'
  resources :users, only: [:show]
  resources :animes, only: [:show, :new, :create] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create, :destroy] do
      resources :comments, only: [:create]
    end
  end

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  post 'watch/:id' => 'watches#create', as: 'create_watch'
  delete 'watch/:id' => 'watches#destroy', as: 'destroy_watch'

  post 'want/:id' => 'wants#create', as: 'create_want'
  delete 'want/:id' => 'wants#destroy', as: 'destroy_want'
end
