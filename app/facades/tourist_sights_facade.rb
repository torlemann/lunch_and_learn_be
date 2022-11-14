class TouristSightsFacade
    def self.get_country(country)
        country_json = TouristSightsService.get_country(country)
        capital_lng_lat = country_json.map do |country_data|
            CapitalInfo.new(country_data)
        end
    end

    def self.get_sights(lng, lat)
        sights_json = TouristSightsService.get_sights(lng, lat)
        sights = sights_json.map do |sight_data|
            TouristSights.new(sight_data)
        end
    end
end