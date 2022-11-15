require 'rails_helper'

RSpec.describe 'favorites request spec' do
  it 'creates favorites', :vcr do 
    VCR.eject_cassette
    VCR.turn_off!
    user_params = { 
      email: "smoochy@gmail.com",
      name: "Robin"
    }

    post '/api/v1/users',  params: user_params

    new_user = User.last

    favorites_params = {
      "api_key": new_user.api_key,
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