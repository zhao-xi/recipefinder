class RecipesControllerController < ApplicationController
  def index
    @keyword = params[:search]
    @recipes = Recipe.for @keyword
  end
end
