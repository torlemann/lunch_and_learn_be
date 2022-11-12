class EdamamFacade
    def self.get_recipes(country)
        json = EdamamService.get_recipes(country)
        recipes_data = json.shuffle
        recipes = recipes_data.map do |recipe_data|
            Recipe.new(recipe_data, country)
        end
    end
end