class Api::V1::TouristSightsController < ApplicationController
    def index
      country = params[:country]
      capital, lng, lat = TouristSightsFacade.get_country(country)
      sights = TouristSightsFacade.get_sights(lng, lat)
      render(json: TouristSightsSerializer.new(sights)) 
    end
  end