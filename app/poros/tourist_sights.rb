class TouristSights
    attr_reader :name, :address, :place_id

    def initialize(data)
        binding.pry
        @name = [:features][0][:properties][:name]
        @address = [:features][0][:properties][:formatted]
        @place_id = [:features][0][:place_id]
    end
end