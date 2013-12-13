ThingContributor::Application.routes.draw do
  root to: "application#index"

  get "/things/a/:admin_url", to: "things#show_admin", as: :thing
  get "/things/p/:public_url", to: "things#show_public"
  post "/things/a", to: "things#create"
  put "/things/:id", to: "things#update"

  get "/contributors/:id", to: "contributors#show"
  post "/contributors", to: "contributors#create"
  # put "/contributors/:id", to: "contributors#update"

  match "*path", to: "application#index"

  # get "/a/:string", to: "application#index"

  # get "/:anything", to: "application#index"


end
