require 'rails_helper'

RSpec.describe EdamamService do
  it 'returns recipes data by country', :vcr do
    allow(CountryFacade).to receive(:get_country_name).and_return('Italy')
    country = CountryFacade.get_country_name
    recipes = EdamamService.get_recipes(country)
    expect(recipes).to be_a Hash
    expect(recipes).to have_key :hits
    expect(recipes[:hits]).to be_an Array
    expect(recipes[:hits][0][:recipe]).to be_a Hash
    expect(recipes[:hits][0][:recipe]).to have_key :label
    expect(recipes[:hits][0][:recipe]).to have_key :url
    expect(recipes[:hits][0][:recipe]).to have_key :images
    expect(recipes[:hits][0][:recipe][:images]).to have_key :THUMBNAIL
    expect(recipes[:hits][0][:recipe][:images][:THUMBNAIL]).to have_key :url
    expect(recipes[:hits][0][:recipe][:images][:THUMBNAIL][:url]).to be_a String
  end
end