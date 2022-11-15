require 'rails_helper'

RSpec.describe 'favorites request spec' do
  it 'creates favorites', :vcr do 
    VCR.eject_cassette
    VCR.turn_off!
    favorites_params = {
      "api_key": "jgn983hy48thw9begh98h4539h4",
      "country": "thailand",
      "recipe_link": "https://www.tastingtable.com/.....",
      "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }

    post '/api/v1/favorites', params: favorites_params

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 201
  end
end