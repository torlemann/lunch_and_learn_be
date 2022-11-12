class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      country = params[:country]
    else
      country = CountryFacade.get_country_name.common_name
    end
    recipes = EdamamFacade.get_recipes(country)
    render(json: RecipeSerializer.new(recipes))    
  end
end