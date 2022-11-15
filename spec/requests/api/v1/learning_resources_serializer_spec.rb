require 'rails_helper'

RSpec.describe 'learning resource API requests' do
  it 'returns empty video array for country without an exact Mr History video match', :vcr do 
    get '/api/v1/learning_resources?country=thailand'
    
    expect(response.status).to eq(200)

    resource = JSON.parse(response.body, symbolize_names: true)
    expect(resource).to have_key :data
    expect(resource[:data]).to be_a Hash
    expect(resource[:data]).to have_key :id
    expect(resource[:data]).to have_key :type
    expect(resource[:data]).to have_key :attributes
    expect(resource[:data][:attributes]).to have_key :country
    expect(resource[:data][:attributes]).to have_key :video
    expect(resource[:data][:attributes][:video]).to eq ([])
    expect(resource[:data][:attributes][:images]).to be_an Array
  end
end