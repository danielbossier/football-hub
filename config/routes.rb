Rails.application.routes.draw do
  get "/teams" => "teams#index"
  get "/display" => "teams#display"
  post "/teams" => "teams#create"
  get "/teams/:id" => "teams#show"
  patch "/teams/:id" => "teams#update"
  delete "/teams/:id" => "teams#destroy"
end
