require 'rails_helper'

RSpec.describe UnsplashService do

    it 'establishes a connection for unsplash', :vcr do
    result = UnsplashService.get_images('thailand')
    expect(result).to be_a Hash
    expect(result).to have_key :results
    expect(result[:results]).to be_an Array
    expect(result[:results].length).to eq 10
    expect(result[:results][0]).to have_key :urls
    expect(result[:results][0][:urls]).to be_a Hash
    expect(result[:results][0][:urls]).to have_key :regular
    expect(result[:results][0][:urls][:regular]).to be_a String
    end
end
