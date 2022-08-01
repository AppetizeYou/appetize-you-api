class ReviewsController < ApplicationController
    before_action :authenticate_user, only: %i[create]
    before_action :set_recipe
    
    def index
        @reviews = []

        @recipe.reviews.each do |review|
            @reviews << review.beautify_review
        end

        render json: @reviews
    end

    def create
        @review = @recipe.reviews.create(reviewer: current_user, comment: review_params[:comment])

        render json: @review
    end

    private

    def review_params
        params.permit(:id, :comment)
    end

    def set_recipe
        @recipe = Recipe.find(review_params[:id])
    end
end
