LiveTogether::Application.routes.draw do
  devise_for :users
  root to: "pages#main"
end
