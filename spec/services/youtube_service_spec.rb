require 'rails_helper'

RSpec.describe YoutubeService do

    it 'establishes a connection for youtube Mr. History Channel', :vcr do
    result = YoutubeService.get_videos('panama')
    expect(result).to be_a Hash
    expect(result).to have_key :items
    expect(result[:items]).to be_an Array
    expect(result[:items][0]).to have_key :snippet
    expect(result[:items][0][:snippet]).to be_a Hash
    expect(result[:items][0][:snippet]).to have_key :title
    expect(result[:items][0][:snippet][:title]).to eq("A Super Quick History of Panama")
    expect(result[:items][0]).to have_key :id
    expect(result[:items][0][:id]).to be_a Hash
    expect(result[:items][0][:id]).to have_key :videoId
    expect(result[:items][0][:id][:videoId]).to eq('DDwXuTNS7NY') 
    end
end
