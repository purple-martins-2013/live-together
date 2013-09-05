LiveTogether::Application.routes.draw do
  devise_for :users
  root to: "houses#show"
end
