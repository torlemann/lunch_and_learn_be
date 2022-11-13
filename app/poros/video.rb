class Video
    attr_reader :title, :video_id, :country

    def initialize(data, country)
        @video_id = data[:id][:videoId]
        @title = data[:snippet][:title]
        @country = country
    end
end