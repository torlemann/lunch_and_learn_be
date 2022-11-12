class Api::V1::RecipesController < ApplicationController
    def index
      @country = CountryFacade.get_country
      @recipes = RecipesFacade.get_recipes(country)
    end
end