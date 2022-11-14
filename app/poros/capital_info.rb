class CapitalInfo
    attr_reader :capital, :lng:, :lat
    def initialize(data)
        @capital = data[0][:capital]
        @lng = data[0][:latlng][1]
        @lat = data[0][:latlng][0]
    end
end