class OccasionCategoriesController < ApplicationController
    def show
        @occasion_categories = OccasionCategory.all
    
        render json: @occasion_categories
      end
end
