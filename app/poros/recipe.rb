class Recipe
    attr_reader :title, :url, :image, :country

    def initialize(data, country)
        @title = data[:recipe][:label]
        @url = data[:recipe][:url]
        @image = data[:recipe][:images][:THUMBNAIL][:url]
        @country = country
    end
end
