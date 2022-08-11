require "rails_helper"

RSpec.describe "OccasionCategories", type: :request do
    describe "return occasion categories at /recipes/occasion_categories" do
        it "with 11 entries " do
            get "/recipes/occasion_categories"

            categories = JSON.parse(response.body)

            expect(categories.size).to eq(9)
        end
    end

    #   describe "GET /index" do
    #     pending "add some examples (or delete) #{__FILE__}"
    #   end
end
