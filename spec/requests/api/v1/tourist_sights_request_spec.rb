require 'rails_helper'

RSpec.describe 'tourist sights API requests' do
  it 'returns sights from user specified country' do 
    get '/api/v1/tourist_sights?country=france'
    
    expect(response.status).to eq(200)

    sights = JSON.parse(response.body, symbolize_names: true)

    expect(sights[:data]).to be_an Array
    expect(sights[:data][0].length).to eq 3
    expect(sights[:data][0]).to have_key :id
    expect(sights[:data][0][:id]).to eq(nil)
    expect(sights[:data][0][:type]).to eq("tourist_sight")  
    expect(sights[:data][0][:attributes]).to be_a Hash
    expect(sights[:data][0][:attributes].length).to eq 3
    expect(sights[:data][0][:attributes]).to have_key :name
    expect(sights[:data][0][:attributes][:name]).to be_a String
    expect(sights[:data][0][:attributes]).to have_key :address
    expect(sights[:data][0][:attributes][:address]).to be_a String
    expect(sights[:data][0][:attributes]).to have_key :place_id
    expect(sights[:data][0][:attributes][:place_id]).to be_a String
  end
end
