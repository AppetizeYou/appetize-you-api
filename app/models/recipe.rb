class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"

  belongs_to :type_category
  belongs_to :occasion_category
  belongs_to :main_ingredient_category
  belongs_to :cooking_method_category
end
