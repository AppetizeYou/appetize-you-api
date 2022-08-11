require "rails_helper"

RSpec.describe Recipe, type: :model do
    before(:each) { @user = FactoryBot.create(:user, email: "rspectest@test.com", username: "rspectest", password: "123qwe", password_confirmation: "123qwe") }

    subject do
        described_class.new(
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

    it "should successfully create a recipe with all given details" do
        expect(subject).to be_valid
    end

    it "should cause an error if the title is not given" do
        subject.title = ""
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the serve is not given" do
        subject.serve = nil
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the author is not given" do
        subject.author = nil
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the type_category_id is not given" do
        subject.type_category_id = nil
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the occasion_category_id is not given" do
        subject.occasion_category_id = nil
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the main_ingredient_category_id is not given" do
        subject.main_ingredient_category_id = nil
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the cooking_method_category_id is not given" do
        subject.cooking_method_category_id = nil
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the ingredients is empty" do
        subject.ingredients = []
        
        expect(subject).not_to be_valid
    end

    it "should cause an error if the steps is empty" do
        subject.steps = []
        
        expect(subject).not_to be_valid
    end

    #   pending "add some examples to (or delete) #{__FILE__}"
end
