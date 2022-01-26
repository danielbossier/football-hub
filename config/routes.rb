Rails.application.routes.draw do
  get "/teams" => "teams#index"
  get "/display" => "teams#display"
  post "/teams" => "teams#create"
  get "/teams/:id" => "teams#show"
  patch "/teams/:id" => "teams#update"
  delete "/teams/:id" => "teams#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/groups" => "groups#index"
  post "/groups" => "groups#create"
  get "/groups/:id" => "groups#show"

  get "/group_users" => "group_users#index"
  get "/group_users" => "group_users#create"

  get "/team_users" => "team_users#index"
  get "/team_users" => "team_users#create"
end
