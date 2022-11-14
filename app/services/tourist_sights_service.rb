class TouristSightsService
    
    def self.get_country(country)
        response = conn.get("/v3.1/name/#{country}?fullText=true&fields=latlng")
        JSON.parse(response.body, symbolize_names: true)
    end

    def self.get_sights(lng, lat)
        response = conn.get("/v2/places?categories=tourism.sights&limit=20&apiKey=#{ENV['geoapify_key']}&filter=circle:#{lng,lat},20000")
        JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.conn_country
      Faraday.new(url: 'https://restcountries.com')
    end

    def self.conn_sights
      Faraday.new(url: 'https://api.geoapify.com')
    end
end