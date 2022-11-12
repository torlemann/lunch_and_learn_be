require 'rails_helper'

RSpec.describe CountryService do

    it 'establishes a connection for all countries', :vcr do
      result = CountryService.get_country
      expect(result).to be_an(Array)
      expect(result.count).to eq 250
      expect(result[0]).to be_a Hash
      expect(result[0]).to have_key :name
      expect(result[0][:name]).to be_a Hash
      expect(result[0][:name]).to have_key :common
      expect(result[0][:name][:common]).to be_a String
    end
end
