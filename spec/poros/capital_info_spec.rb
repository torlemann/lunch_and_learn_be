require 'rails_helper'

RSpec.describe CapitalInfo do
  it 'exists' do
    attrs = {
                :capital=>["Paris"],
                :altSpellings=>["FR", "French Republic", "République française"],
                :latlng=>[46.0, 2.0]
            }

    info = CapitalInfo.new(attrs)
    expect(info).to be_a CapitalInfo
    expect(info.capital).to eq("Paris")
    expect(info.lat).to eq(46.0)
    expect(info.lng).to eq(2.0)
  end
  
end