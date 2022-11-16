require 'rails_helper'

RSpec.describe 'favorites request spec' do
  describe "post" do
    it 'happy path creates favorites with valid api key', :vcr do 
      # VCR.eject_cassette
      # VCR.turn_off!
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

    it 'sad path returns error with invalid api key', :vcr do 

      favorites_params = {
        "api_key": "kjadoiu398479t8yghubdjkvnsjr932",
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post '/api/v1/favorites', params: favorites_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq 400
      expect(json[:error]).to eq("Unable to find user by API key. A valid API key must be provided to create favorite.")
    end
  end

  describe "get" do
    it "happy path returns all favorites with specified api key", :vcr do
      user_params = { 
        email: "smoochy@gmail.com",
        name: "Robin"
      }

      post '/api/v1/users',  params: user_params

      user = User.last

      favorite_params_1 = {
        "api_key": user.api_key,
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post '/api/v1/favorites', params: favorite_params_1

      favorite_params_2 = {
        "api_key": user.api_key,
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Pad Kee Mao"
      }

      post '/api/v1/favorites', params: favorite_params_2

      favorites = Favorite.all

      favorites_request_params = {
        "api_key": user.api_key
      }

      get '/api/v1/favorites', params: favorites_request_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json).to be_a Hash
      expect(json).to have_key :data
      expect(json[:data]).to be_an Array
      expect(json[:data].count).to eq 2
      expect(json[:data][0]).to be_a Hash
      expect(json[:data][0].keys).to eq([:id, :type, :attributes])
      expect(json[:data][0][:id]).to be_an Integer
      expect(json[:data][0][:type]).to eq("favorite")
      expect(json[:data][0][:attributes].keys).to eq([:country, :recipe_title, :recipe_link, :created_at])   
      expect(json[:data][0][:attributes][:country]).to be_a String
      expect(json[:data][0][:attributes][:recipe_link]).to be_a String
      expect(json[:data][0][:attributes][:recipe_title]).to be_a String
      expect(json[:data][0][:attributes][:created_at]).to be_a String
    end

    it "sad path returns error with invalid api key", :vcr do
      user_params = { 
        email: "smoochy@gmail.com",
        name: "Robin"
      }

      post '/api/v1/users',  params: user_params

      user = User.last

      favorites_request_params = {
        "api_key": user.api_key
      }

      get '/api/v1/favorites', params: favorites_request_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json).to be_a Hash
      expect(json[:data]).to eq([])
    end
  end
end