LiveTogether::Application.routes.draw do
  devise_for :users
  get '/auth/:provider/callback', to: 'authentications#create'

  root to: "houses#show"

  resources :users, only: [:index]

  resources :chores, only: [:index, :show, :new, :create, :update]
  resources :houses, only: [:show, :new, :create]
  resources :grocery_lists do
    resources :grocery_items, only: [:new, :create, :show, :index]
  end

  resources :grocery_items, only: [:destroy]

  resources :invitations, only: [:create] do
    member { get 'accept' }
  end
  resources :completed_chores, only: [:index]

  resources :expenses, only: [:index, :show, :new, :create]
  resources :payments, only: [:index, :show, :new, :create, :destroy]

  post '/request_payment', to: 'payments#payment_request', as: 'payment_request'
  post '/suscribe', to: 'grocery_lists#suscribe'
  post '/unsuscribe', to: 'grocery_lists#unsuscribe'
  post '/new_from_grocery_list', to: 'expenses#new_from_grocery_list'
end
