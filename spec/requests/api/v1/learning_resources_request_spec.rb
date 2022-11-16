require 'rails_helper'

RSpec.describe 'learning resource API requests' do
  it 'happy path returns Mr History video match for country', :vcr do 
    get '/api/v1/learning_resources?country=mauritania'
    
    expect(response.status).to eq(200)

    resource = JSON.parse(response.body, symbolize_names: true)
    expect(resource).to have_key :data
    expect(resource[:data]).to be_a Hash
    expect(resource[:data]).to have_key :id
    expect(resource[:data]).to have_key :type
    expect(resource[:data]).to have_key :attributes
    expect(resource[:data][:attributes]).to have_key :country
    expect(resource[:data][:attributes]).to have_key :video
    expect(resource[:data][:attributes][:video][:title]).to eq ("A Super Quick History of Mauritania")
  end

  it 'happy path returns images for country', :vcr do 
    get '/api/v1/learning_resources?country=thailand'
    
    expect(response.status).to eq(200)

    resource = JSON.parse(response.body, symbolize_names: true)
    expect(resource[:data][:attributes][:images]).to be_an Array
  end

  it 'sad path returns empty video array for country without an exact Mr History video match', :vcr do 
    get '/api/v1/learning_resources?country=thailand'
    
    expect(response.status).to eq(200)

    resource = JSON.parse(response.body, symbolize_names: true)
    expect(resource[:data][:attributes][:video]).to eq ([])
  end

  it 'sad path returns empty image array for country with no results', :vcr do 
    json = {
      "total": 0,
      "total_pages": 0,
      "results": []
    }

    allow(UnsplashService).to receive(:get_images).and_return(json)
    get '/api/v1/learning_resources?country=thailand'
    
    expect(response.status).to eq(200)
    resource = JSON.parse(response.body, symbolize_names: true)
    expect(resource[:data][:attributes][:images]).to eq ([])
  end
end