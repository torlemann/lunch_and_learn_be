class YoutubeFacade
    def self.get_videos(country)
        json = YoutubeService.get_videos(country)
        # if json[:items][0][:snippet][:title] does not contain country
        #     json = []
        # else
            video = json[:items][0].map do |video_data|
                Video.new(video_data, country)
            end
        end
    end
end