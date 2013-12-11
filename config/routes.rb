DashRun::Application.routes.draw do
  root to: "application#index"
  get "/a/:string", to: "application#index"


end
