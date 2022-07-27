class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"

  belongs_to :type_category
  belongs_to :occasion_category
  belongs_to :main_ingredient_category
  belongs_to :cooking_method_category

  def beautify_recipe
    return(
      {
        title: self.title,
        serve: self.serve,
        author: self.author.username,
        created_at: self.created_at,
        updated_at: self.updated_at,
        type_category: self.type_category.name,
        occasion_category: self.occasion_category.name,
        main_ingredient_category: self.main_ingredient_category.name,
        cooking_method_category: self.cooking_method_category.name,
        ingredients: Recipe.format_ingredient(self.ingredients),
        steps: self.steps
      }
    )
  end

  def self.format_ingredient(ingredients)
    formatted_ingredient = []
    ingredients.each do |ingredient|
      separated_ingredient = ingredient.split(",")
      formatted_ingredient << { name: separated_ingredient[0], amount: separated_ingredient[1], unit: separated_ingredient[2] }
    end

    return formatted_ingredient
  end
end
