LiveTogether::Application.routes.draw do
  devise_for :users
  root to: "houses#show"

  resources :chores, only: [:index, :new, :create]
end
