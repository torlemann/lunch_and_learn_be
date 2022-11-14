require 'rails_helper'

RSpec.describe TouristSightsService do

    it 'establishes a connection for a country' do
      result = TouristSightsService.get_country('france')
      expect(result).to be_an Array
      expect(result.count).to eq 1
      expect(result[0]).to be_a Hash
      expect(result[0]).to have_key :capital
      expect(result[0][:capital]).to be_an Array
      expect(result[0][:capital].length).to eq 1
      expect(result[0][:capital][0]).to be_a String
      expect(result[0]).to have_key :latlng
      expect(result[0][:latlng]).to be_an Array
      expect(result[0][:latlng].length).to eq 2
      expect(result[0][:latlng][0]).to be_a Float
    end
end