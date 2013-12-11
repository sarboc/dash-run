DashRun::Application.routes.draw do
  root to: "application#index"
  resources :things

  # get "/a/:string", to: "application#index"

  # get "/:anything", to: "application#index"


end
