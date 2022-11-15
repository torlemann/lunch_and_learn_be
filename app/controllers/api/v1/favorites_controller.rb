class Api::V1::FavoritesController < ApplicationController
    def create
      favorite = Favorite.new(favorites_params)
      user = User.find_by(api_key: params[:api_key])
      if user != nil
        favorite.save
        render json:(FavoritesSerializer.format), status: :created
      else
        render json: { error: "Unable to find user by API key. A valid API key must be provided to create favorite."}, status: 400 
      end
    end

    private
    def favorites_params
        params.permit(:country, :recipe_link, :recipe_title, :api_key)
    end
end