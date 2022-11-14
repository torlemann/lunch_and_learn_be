class LearningResourcesSerializer
    def self.format(video, country)
        {
            "data": {
                "id": nil,
                "type": "learning_resource",
                "attributes": {
                    "country": country,
                    "video": video
                }
            }
        }
    end
end
