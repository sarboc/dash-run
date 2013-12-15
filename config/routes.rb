ThingContributor::Application.routes.draw do
  root to: "application#index"

  get "/things/a/:admin_url", to: "things#show_admin", as: :thing
  post "/things/a", to: "things#create"
  put "/things/a/:admin_url", to: "things#update"

  get "/things/p/:public_url", to: "things#show_public"

  get "/contributors", to: "contributors#show", as: :contributors
  post "/contributors/:public_url", to: "contributors#create"
  # put "/contributors/:id", to: "contributors#update"

  match "*path", to: "application#index"

  # get "/a/:string", to: "application#index"

  # get "/:anything", to: "application#index"


end
