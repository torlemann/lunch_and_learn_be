class EdamamService
    
    def self.get_recipes(country)
        response = conn.get("/api/recipes/v2?type=public&q=#{country}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_app_key']}")
        JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.conn
      Faraday.new(url: 'https://api.edamam.com')
    end
end