require "rails_helper"

RSpec.describe "TypeCategories", type: :request do
    describe "return type categories at /recipes/type_categories" do
        it "with 11 entries " do
            get "/recipes/type_categories"

            categories = JSON.parse(response.body)

            expect(categories.size).to eq(12)
        end
    end

    #   describe "GET /index" do
    #     pending "add some examples (or delete) #{__FILE__}"
    #   end
end
