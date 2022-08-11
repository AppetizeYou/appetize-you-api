require "rails_helper"

RSpec.describe Review, type: :model do
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
    end

    subject { described_class.new(reviewable_type: "Recipe", reviewable_id: @recipe.id, reviewer_id: @reviewer.id, comment: "NICE RECIPE", rating: 4) }

    it "should successfully create a review with all given details" do
        expect(subject).to be_valid
    end

    it "should cause an error if the reviewer is not given" do
        subject.reviewer = nil
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the comment is not given" do
        subject.comment = ""
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the rating is not given" do
        subject.rating = nil
        
        expect(subject).not_to be_valid
    end

    #   pending "add some examples to (or delete) #{__FILE__}"
end
