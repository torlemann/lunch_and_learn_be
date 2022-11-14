class TouristSightsFacade
    def self.get_country(country)
        country_json = TouristSightsService.get_country(country)
        capital_info = country_json.map do |country_data|
            CapitalInfo.new(country_data)
        end
        capital_info
    end
end