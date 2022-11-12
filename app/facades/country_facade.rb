class CountryFacade
    def self.get_country_name
        json = CountryService.get_country
        countries = json.shuffle
        country = countries.map do |country_data|
            Country.new(country_data)
        end
    end
end