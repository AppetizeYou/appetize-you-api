class CookingMethodCategoriesController < ApplicationController
    def show
        @cooking_method_categories = CookingMethodCategory.all
    
        render json: @cooking_method_categories
      end
end
