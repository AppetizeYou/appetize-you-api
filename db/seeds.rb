# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

type_categories = %w[entree side main soup dessert noodle sauce salad pastry snack drink etc]
type_categories.each { |category| TypeCategory.create(name: category) } if TypeCategory.count == 0

occasion_categories = ["daily", "fast", "weight loss", "bento", "healthy", "food styling", "special event", "baby food", "etc"]
occasion_categories.each { |category| OccasionCategory.create(name: category) } if OccasionCategory.count == 0

main_ingredient_categories = ["beef", "pork", "poultry", "red meat", "vegetable", "seafood", "egg", "dairy", "rice", "flour", "mushroom", "fruit", "nut", "lentil", "grain", "etc"]
main_ingredient_categories.each { |category| MainIngredientCategory.create(name: category) } if MainIngredientCategory.count == 0

cooking_method_categories = ["boiling", "shallow frying", "stir frying", "deep frying", "grilling", "roasting", "broiling", "searing", "baking", "sauteing", "etc"]
cooking_method_categories.each { |category| CookingMethodCategory.create(name: category) } if CookingMethodCategory.count == 0

units = [
    { name: "gram", abbreviation: "g" },
    { name: "kilogram", abbreviation: "kg" },
    { name: "millilitre", abbreviation: "ml" },
    { name: "litre", abbreviation: "l" },
    { name: "millimetre", abbreviation: "mm" },
    { name: "centimetre", abbreviation: "cm" },
    { name: "metre", abbreviation: "m" },
    { name: "each", abbreviation: "ea" }
]
units.each { |unit| Unit.create(name: unit[:name], abbreviation: unit[:abbreviation]) } if Unit.count == 0

if User.count == 0
    User.create(email: "kyle@test.com", username: "Kyle", password: "123123", password_confirmation: "123123")
    User.create(email: "borav@test.com", username: "Borav", password: "123qwe", password_confirmation: "123qwe")
end

if Recipe.count == 0
    Recipe.create(
        title: "Donkatsu",
        serve: 1,
        author: User.first,
        type_category_id: 3,
        occasion_category_id: 4,
        main_ingredient_category_id: 2,
        cooking_method_category_id: 4,
        steps: ["Season the meat with salt and pepper", "Pad the meat on plain flour", "Egg wash the meat", "Pad the meat on bread crumb", "Heat up the oil", "Deep fry the battered meat"],
        ingredients: ["Pork loin,250,g", "Bread crumb,50,g", "Plain flour,50,g", "Egg,1,ea", "Salt,10,g", "Pepper,10,g", "Olive oil,300,ml"]
    )
end

Recipe.first.reviews.create(reviewer: User.where(username: "Borav").first, comment: "Very nice recipe", rating: 4) if Review.count == 0
