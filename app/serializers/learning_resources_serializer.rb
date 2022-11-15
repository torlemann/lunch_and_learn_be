class LearningResourcesSerializer
    def self.format(video, images, country)
        {
            "data": {
                "id": nil,
                "type": "learning_resource",
                "attributes": {
                    "country": country,
                    "video": video,
                    "images": images
                }
            }
        }
    end
end
