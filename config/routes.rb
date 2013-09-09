LiveTogether::Application.routes.draw do
  devise_for :users
  root to: "houses#show"

  resources :chores, only: [:index, :show, :new, :create, :update]
  resources :houses, only: [:show, :new, :create]

  resource :house, only: [:show]

  resources :grocery_lists do
    resources :grocery_items, only: [:new, :create, :show]
  end

  resources :grocery_items, only: [:destroy]

  resources :invitations, only: [:create] do
    member { get 'accept' }
  end
  resources :completed_chores, only: [:index]
end
