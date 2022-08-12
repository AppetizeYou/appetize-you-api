class ReviewsController < ApplicationController
    before_action :authenticate_user, only: %i[create]
    before_action :set_recipe

    # return all reviews of selected recipe
    def index
        @reviews = []

        @recipe.reviews.each { |review| @reviews << review.beautify_review }

        render json: @reviews
    end

    # create new review and return it
    def create
        @review = @recipe.reviews.create(reviewer: current_user, comment: review_params[:comment], rating: review_params[:rating])

        render json: @review
    end

    private

    # permit passed params
    def review_params
        params.permit(:id, :comment, :rating)
    end

    # select recipe
    def set_recipe
        @recipe = Recipe.find(review_params[:id])
    end
end
