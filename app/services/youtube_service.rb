class YoutubeService
    
    def self.get_videos(country)
        response = conn.get("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}&key=#{ENV['youtube_key']}")
        JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.conn
      Faraday.new(url: 'https://www.googleapis.com')
    end
end