class Api::V1::TouristSightsController < ApplicationController
    def index
      country = params[:country]
      capital_info = TouristSightsFacade.get_country(country)
      capital, lng, lat = capital_info
      render(json: RecipeSerializer.new(recipes))    
    end
  end