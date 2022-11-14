class Api::V1::TouristSightsController < ApplicationController
    def index
      capital = TouristSightsFacade.get_country(params[:country])
      capital_name = capital[0].capital
      lng = capital[0].lng
      lat = capital[0].lat
      sights = TouristSightsFacade.get_sights(lng, lat)
      render(json: TouristSightsSerializer.new(sights)) 
    end
  end