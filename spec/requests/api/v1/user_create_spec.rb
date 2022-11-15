require 'rails_helper'

RSpec.describe 'Creating a User' do
  it 'successfully creates a user' do 
    user_params = { 
      email: "smoochy@gmail.com",
      name: "Robin"
    }

    post '/api/v1/users',  params: user_params

    user_json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(user_json).to be_a(Hash)
    expect(user_json[:data][:id]).to be_a String
    expect(user_json[:data][:type]).to be_a String
    expect(user_json[:data][:attributes]).to be_a Hash
    expect(user_json[:data][:attributes][:email]).to be_a String
    expect(user_json[:data][:attributes][:api_key]).to be_a String
    expect(user_json[:data][:attributes][:name]).to be_a String
  end
end