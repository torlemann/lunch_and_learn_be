require 'rails_helper'

RSpec.describe 'tourist sights API requests' do
  it 'returns sights from user specified country' do 
    get '/api/v1/tourist_sights?country=france'
    
    expect(response.status).to eq(200)

    sights = JSON.parse(response.body, symbolize_names: true)
   binding.pry
  end
end
