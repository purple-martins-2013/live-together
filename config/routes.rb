LiveTogether::Application.routes.draw do
  devise_for :users
  root to: "houses#show"

  resources :chores, only: [:index, :show, :new, :create, :update]
  resources :houses, only: [:show, :new, :create]
  resources :grocery_lists
  resources :invitations, only: [:create] do
    member do
      get 'accept'
    end
  end
end
