class Api::V1::FavoritesController < ApplicationController
    def create
      if favorites_params
        render json:(FavoritesSerializer.new), status: :created
      else
        render json: { error: "We are unable to add favorites."}, status: 400 
      end
    end

    private
    def favorites_params
        params.permit(:country, :recipe_link, :recipe_title, :api_key)
    end
end