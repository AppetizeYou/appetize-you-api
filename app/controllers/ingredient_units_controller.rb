class IngredientUnitsController < ApplicationController
  def show
    @units = Unit.all

    render json: @units
  end
end
