class CountryService
    
    def self.get_country
        response = conn.get("/v3.1/all?fields=name")
        JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.conn
      Faraday.new(url: 'https://restcountries.com')
    end
end