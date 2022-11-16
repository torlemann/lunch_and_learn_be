class UnsplashFacade
    def self.get_images(country)
        json = UnsplashService.get_images(country)
        if json[:results].empty?
            images = []
        else
            images = json[:results].map do |image_data|
                Image.new(image_data)
            end
        end
    end
end
