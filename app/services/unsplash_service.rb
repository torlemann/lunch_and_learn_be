class UnsplashService
    
    def self.get_images(country)
        response = conn.get("/search/photos?client_id=#{ENV['unsplash_client_id']}&page=1&query=#{country}")
        JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.conn
      Faraday.new(url: 'https://api.unsplash.com')
    end
end