require "rails_helper"

RSpec.describe "MainIngredientCategories", type: :request do
    describe "return main ingredient categories at /recipes/main_ingredient_categories" do
        it "with 11 entries " do
            get "/recipes/main_ingredient_categories"

            categories = JSON.parse(response.body)

            expect(categories.size).to eq(16)
        end
    end

    #   describe "GET /index" do
    #     pending "add some examples (or delete) #{__FILE__}"
    #   end
end
