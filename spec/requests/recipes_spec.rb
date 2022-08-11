require "rails_helper"

RSpec.describe "Recipes", type: :request do
    before(:each) do
        @user = FactoryBot.create(:user, email: "rspectest@test.com", username: "rspectest", password: "123qwe", password_confirmation: "123qwe")

        FactoryBot.create(
            :recipe,
            title: "Donkatsu",
            serve: 1,
            author: @user,
            type_category_id: 3,
            occasion_category_id: 4,
            main_ingredient_category_id: 2,
            cooking_method_category_id: 4,
            steps: ["Season the meat with salt and pepper", "Pad the meat on plain flour", "Egg wash the meat", "Pad the meat on bread crumb", "Heat up the oil", "Deep fry the battered meat"],
            ingredients: ["Pork loin,250,g", "Bread crumb,50,g", "Plain flour,50,g", "Egg,1,ea", "Salt,10,g", "Pepper,10,g", "Olive oil,300,ml"]
        )
    end

    describe "at /recipes/my_post" do
        it "should return all recipes on GET request" do
            get "/recipes/my_post", headers: authenticated_header(@user)

            expect(response).to have_http_status(200)

            recipes = JSON.parse(response.body)

            expect(recipes.size).to eq(1)
        end
    end

    describe "at /recipes" do
        it "should return all recipes on GET request" do
            get "/recipes"

            expect(response).to have_http_status(200)

            recipes = JSON.parse(response.body)

            # one from Factory bot and one from seed
            expect(recipes.size).to eq(2)
        end

        it "should return newly created recipe on POST requset" do
            post "/recipes",
                      params: {
                          title: "Test",
                          serve: 1,
                          type_category_id: 1,
                          occasion_category_id: 1,
                          main_ingredient_category_id: 1,
                          cooking_method_category_id: 1,
                          steps: ["Cook it"],
                          ingredients: ["dur,250,g"]
                      },
                      headers: authenticated_header(@user)

            recipe = response.body

            expect(recipe).not_to eq(nil)
        end
    end

    describe "at /recipes/weekly" do
        it "should return weekly recipes on GET request" do
            get "/recipes/weekly"

            weekly_recipes = []
            Recipe.where("created_at >= ? and created_at <= ?", Date.today.beginning_of_week, Date.today.end_of_week).each { |recipe| weekly_recipes << RecipeSerializer.new(recipe).serializable_hash[:data][:attributes] } if weekly_recipes

            expect(JSON.parse(response.body).size).to eq(weekly_recipes.size)
        end
    end

    describe "at /recipes/monthly" do
        it "should return monthly recipes on GET request" do
            get "/recipes/monthly"

            monthly_recipes = []
            Recipe.where("created_at >= ? and created_at <= ?", Date.today.beginning_of_week, Date.today.end_of_week).each { |recipe| monthly_recipes << RecipeSerializer.new(recipe).serializable_hash[:data][:attributes] } if monthly_recipes

            expect(JSON.parse(response.body).size).to eq(monthly_recipes.size)
        end
    end

    describe "at /recipes/:id" do
        it "should return selected recipe's details on GET request" do
            get "/recipes/#{Recipe.last.id}"

            expect(response).to have_http_status(:success)
        end

        it "should update and return selected recipe's details on PUT request" do
            old_title = Recipe.last.title

            put "/recipes/#{Recipe.last.id}", params: { title: "NEO Donkatsu" }, headers: authenticated_header(@user)

            expect(JSON.parse(response.body)["title"]).not_to eq(old_title)
        end

        it "should delete selected recipe on DELETE request" do
            id = Recipe.last.id

            delete "/recipes/#{id}", headers: authenticated_header(@user)

            expect(Recipe.last.id).not_to eq (id)
        end
    end

    #   describe "GET /index" do
    #     pending "add some examples (or delete) #{__FILE__}"
    #   end
end
