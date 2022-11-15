class Api::V1::LearningResourcesController < ApplicationController
    def index
      country = params[:country]
      video = YoutubeFacade.get_videos(country)
      images = UnsplashFacade.get_images(country)
      render(json: LearningResourcesSerializer.format(video, images, country))    
    end
  end