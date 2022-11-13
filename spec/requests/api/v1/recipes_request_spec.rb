require 'rails_helper'

RSpec.describe 'recipe API requests' do
  it 'returns recipes from valid user specified country', :vcr do 
    get '/api/v1/recipes?country=thailand'
    
    expect(response.status).to eq(200)

    recipes = JSON.parse(response.body, symbolize_names: true)
    expect(recipes).to have_key :data
    expect(recipes[:data]).to be_an Array
    expect(recipes[:data][0].length).to eq 3
    expect(recipes[:data][0]).to have_key :id
    expect(recipes[:data][0][:id]).to eq(nil)

    expect(recipes[:data][0][:attributes].length).to eq 4
    expect(recipes[:data][0][:attributes]).to have_key :image
    expect(recipes[:data][0][:attributes]).to have_key :country
    expect(recipes[:data][0][:attributes]).to have_key :title
    expect(recipes[:data][0][:attributes][:title]).to be_a String

    expect(recipes[:data][0][:attributes]).to have_key :url
    expect(recipes[:data][0][:attributes][:url]).to be_a String
  end

  it 'returns recipes from randomly selected country' do
    get '/api/v1/recipes'
    
    expect(response.status).to eq(200)

    recipes = JSON.parse(response.body, symbolize_names: true)
    expect(recipes).to have_key :data
    expect(recipes[:data]).to be_an Array
    # expect(recipes[:data][0].length).to eq 3
    # expect(recipes[:data][0].length).to_not eq 4
    # expect(recipes[:data][0]).to have_key :id
    expect(recipes[:data][0].keys).to eq ([:id, :type, :attributes])
    expect(recipes[:data][0][:id]).to eq(nil)

    # expect(recipes[:data][0][:attributes].length).to eq 4
    # expect(recipes[:data][0][:attributes].length).to_not eq 5
    expect(recipes[:data][0][:attributes].keys).to eq ([:title, :url, :country, :image])
    # expect(recipes[:data][0][:attributes]).to have_key :image
    # expect(recipes[:data][0][:attributes]).to have_key :country
    # expect(recipes[:data][0][:attributes]).to have_key :title
    expect(recipes[:data][0][:attributes][:title]).to be_a String

    expect(recipes[:data][0][:attributes]).to have_key :url
    expect(recipes[:data][0][:attributes][:url]).to be_a String
  end

  it 'returns empty array if there are no recipes from specified country', :vcr do 
    get '/api/v1/recipes?country=Wallis and Futuna'
    
    expect(response.status).to eq(200)

    recipes = JSON.parse(response.body, symbolize_names: true)
    expect(recipes).to have_key :data
    expect(recipes[:data]).to be_an Array
    expect(recipes[:data]).to eq([])
  end
end