class Country
    attr_reader :common_name

    def initialize(data)
        @common_name = data[:name][:common]
        # @official_name = data[:name][:official]
    end
end