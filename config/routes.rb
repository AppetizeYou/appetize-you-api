Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    scope "/auth" do
        post "/signup", to: "users#create"
        post "/login", to: "users#login"
        get "/", to: "users#show"
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
        get "/type_categories", to: "type_categories#show"
        get "/occasion_categories", to: "occasion_categories#show"
        get "/main_ingredient_categories", to: "main_ingredient_categories#show"
        get "/cooking_method_categories", to: "cooking_method_categories#show"

        get "/ingredient_units", to: "ingredient_units#show"

        get "/my_post", to: "recipes#my_post"

        get "/", to: "recipes#index"
        post "/", to: "recipes#create"
        get "/:id", to: "recipes#show"
        put "/:id", to: "recipes#update"
        patch "/:id", to: "recipes#update"
        delete "/:id", to: "recipes#destroy"

        get "/:id/reviews", to: "reviews#index"
        post "/:id/review", to: "reviews#create"
    end

    resources :contacts, only: [:new, :create]
end
