class FavoritesSerializer 

    def self.create_format
        {
            success: "Favorite added successfully"
        }
    end

    def self.get_format(data)
                data_json = data.map do |data|
                    {
                        "id": data.id,
                        "type": "favorite",
                        "attributes": {
                            "country": data.country,
                            "recipe_title": data.recipe_title,
                            "recipe_link": data.recipe_link,
                            "created_at": data.created_at
                        }
                    }
                end
            { 
            "data": data_json
            }
    end
end