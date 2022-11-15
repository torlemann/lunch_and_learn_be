class Image
    attr_reader :alt_tag, :image_url
    def initialize(data)
        @alt_tag = data[:alt_description]
        @image_url = data[:urls][:regular]
    end
end