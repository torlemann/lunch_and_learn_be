class Api::V1::LearningResourcesController < ApplicationController
    def index
      country = params[:country]
      video = YoutubeFacade.get_videos(country)
      render(json: LearningResourcesSerializer.format(video, country))    
    end
  end