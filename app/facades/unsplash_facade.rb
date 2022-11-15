class UnsplashFacade
    def self.get_images(country)
        json = UnsplashService.get_images(country)
        images = json[:results].map do |image_data|
            Image.new(image_data)
        end
    end
end
