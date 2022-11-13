class EdamamFacade
    def self.get_recipes(country)
        json = EdamamService.get_recipes(country)
        if json[:hits].nil?
            recipes = []
        else
            recipes = json[:hits].map do |recipe_data|
                Recipe.new(recipe_data, country)
            end
        end
    end
end