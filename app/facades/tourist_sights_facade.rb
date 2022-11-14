class TouristSightsFacade
    def self.get_country(country)
        country_json = TouristSightsService.get_country(country)
        capital_lng_lat = country_json.map do |country_data|
            TouristSights.new(country_data)
        end
    end
end