require "rails_helper"

RSpec.describe "Reviews", type: :request do
    before(:each) do
        @author = FactoryBot.create(:user, email: "rspectest@test.com", username: "rspectest", password: "123qwe", password_confirmation: "123qwe")
        @reviewer = FactoryBot.create(:user, email: "rspectest2@test.com", username: "rspectest2", password: "123123", password_confirmation: "123123")

        @recipe =
            FactoryBot.create(
                :recipe,
                title: "Donkatsu",
                serve: 1,
                author: @author,
                type_category_id: 3,
                occasion_category_id: 4,
                main_ingredient_category_id: 2,
                cooking_method_category_id: 4,
                steps: ["Season the meat with salt and pepper", "Pad the meat on plain flour", "Egg wash the meat", "Pad the meat on bread crumb", "Heat up the oil", "Deep fry the battered meat"],
                ingredients: ["Pork loin,250,g", "Bread crumb,50,g", "Plain flour,50,g", "Egg,1,ea", "Salt,10,g", "Pepper,10,g", "Olive oil,300,ml"]
            )

        @recipe.reviews.create(reviewer: @reviewer, comment: "NICE", rating: 4)
        @recipe.reviews.create(reviewer: @reviewer, comment: "YEAH!", rating: 3)
    end

    describe "at /recipes/:id/reviews" do
        it "should return reviews on GET request" do
            get "/recipes/#{@recipe.id}/reviews"

            reviews = JSON.parse(response.body)

            expect(reviews.size).to eq(2)
        end

        it "should create and return new review on POST request" do
            post "/recipes/#{@recipe.id}/review", params: { comment: "Testing", rating: 5 }, headers: authenticated_header(@reviewer)

            review = JSON.parse(response.body)

            expect(review).to include("comment")
            expect(review).to include("reviewer_id")
            expect(review).to include("rating")
        end
    end

    #   describe "GET /index" do
    #     pending "add some examples (or delete) #{__FILE__}"
    #   end
end
