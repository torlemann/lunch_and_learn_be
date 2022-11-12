class Recipe
    attr_reader :title, :url, :image, :country

    def initialize(data, country)
        @title = data[:hits][0][:recipe][:label]
        @url = data[:hits][0][:recipe][:url]
        @image = data[:hits][0][:recipe][:images][:THUMBNAIL][:url]
        @country = country
    end
end
