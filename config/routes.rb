Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "/auth" do
    post "/signup", to: "users#create"
    post "/login", to: "users#login"
    put "/", to: "users#update"
    patch "/", to: "users#update"
    delete "/", to: "users#destroy"
  end

  scope "/messages" do
    get "/", to: "messages#index"
    post "/", to: "messages#create"
    get "/:id", to: "messages#show"
  end

  scope "/recipes" do
    get "/", to: "recipes#index"
    post "/", to: "recipes#create"
    get "/:id", to: "recipes#show"
    put "/:id", to: "recipes#update"
    patch "/:id", to: "recipes#update"
    delete "/:id", to: "recipes#destroy"
  end
end
