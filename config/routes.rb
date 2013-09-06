LiveTogether::Application.routes.draw do
  devise_for :users
  root to: "houses#show"

  resources :chores, only: [:index, :show, :new, :create]
  resources :houses, only: [:show, :new, :create]
  resources :invitations, only: [:create]
end
