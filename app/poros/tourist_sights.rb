class TouristSights
    attr_reader :name, :address, :place_id

    def initialize(data)
        @name = data[:features][0][:properties][:name]
        @address = data[:features][0][:properties][:formatted]
        @place_id = data[:features][0][:place_id]
    end
end