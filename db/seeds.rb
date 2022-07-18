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

main_ingredient_categories = ["beef", "pork", "poultry", "red meat", "vegetable", "seafood", "egg", "dairy", "rice", "flour", "mushroom", "fruit", "nut", "lentil", "grain"]
main_ingredient_categories.each { |category| MainIngredientCategory.create(name: category) } if MainIngredientCategory.count == 0

cooking_method_categories = ["boiling", "shallow frying", "stir frying", "deep frying", "grilling", "roasting", "broiling", "searing", "baking", "sauteing"]
cooking_method_categories.each { |category| CookingMethodCategory.create(name: category) } if CookingMethodCategory.count == 0

units = [
  { name: "gram", abbreviation: "g" },
  { name: "kilogram", abbreviation: "kg" },
  { name: "millilitre", abbreviation: "ml" },
  { name: "litre", abbreviation: "l" },
  { name: "millimetre", abbreviation: "mm" },
  { name: "centimetre", abbreviation: "cm" },
  { name: "metre", abbreviation: "m" }
]
units.each { |unit| Unit.create(name: unit[:name], abbreviation: unit[:abbreviation]) } if Unit.count == 0
