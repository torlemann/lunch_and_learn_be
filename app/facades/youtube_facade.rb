class YoutubeFacade
    def self.get_videos(country)
        json = YoutubeService.get_videos(country)
        if json[:items][0][:snippet][:title] != "A Super Quick History of #{country.capitalize}"
            video = []
        else
            json = json[:items][0]
            video = Video.new(json, country)
        end
    end
end
