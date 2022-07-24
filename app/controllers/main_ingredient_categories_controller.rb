class MainIngredientCategoriesController < ApplicationController
    def show
        @main_ingredient_categories = MainIngredientCategory.all
    
        render json: @main_ingredient_categories
      end
end
