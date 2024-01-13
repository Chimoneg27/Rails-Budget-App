Rails.application.routes.draw do
  get 'splash', to: 'splash#index', as: 'splash'

  devise_for :users

  resources :users
  resources :groups, only: [:index, :new, :create] do
    resources :purchases, only: [:index, :new, :create]
  end

  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'splash#index', as: :unauthenticated_root
  end

  # root to: "groups#index"
end
