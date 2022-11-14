class CapitalInfo
    attr_reader :capital, :lng, :lat
    def initialize(data)
        @capital = data[:capital][0]
        @lng = data[:latlng][1]
        @lat = data[:latlng][0]
    end
end