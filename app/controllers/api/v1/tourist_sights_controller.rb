class Api::V1::TouristSightsController < ApplicationController
    def index
      capital = TouristSightsFacade.get_country(params[:country])
      binding.pry
      sights = TouristSightsFacade.get_sights(lng, lat)
      render(json: TouristSightsSerializer.new(sights)) 
    end
  end