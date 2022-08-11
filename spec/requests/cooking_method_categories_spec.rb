require "rails_helper"

RSpec.describe "CookingMethodCategories", type: :request do
    describe "return cooking method categories at /recipes/cooking_method_categories" do
        it "with 11 entries " do
            get "/recipes/cooking_method_categories"

            categories = JSON.parse(response.body)

            expect(categories.size).to eq(11)
        end
    end

    #   describe "GET /index" do
    #     pending "add some examples (or delete) #{__FILE__}"
    #   end
end
