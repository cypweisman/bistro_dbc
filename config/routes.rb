Rails.application.routes.draw do
  root to: "sessions#new"
  resources :users, only: [:new, :create, :show] do
    resources :recipes, only: [:new, :create]
    resources :menus, only: [:new, :create]
  end
  resources :recipes, only: [:index, :show, :edit, :update] do
    resources :ingredients, only: [:new, :create]
  end
  resources :menus, only: [:show, :edit, :update, :destroy] do

    member do

      get "print"
    end
  end

  resources :menu_items, only: [:create, :destroy, :edit, :update]


  resources :sessions, only: [:new, :create, :destroy]


end
