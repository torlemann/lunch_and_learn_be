require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do 
    let(:favorite) { FactoryBot.create(:favorite)}

    describe '#country' do 
      it { should validate_presence_of(:country) }
      it { should_not allow_value(nil).for(:country) }
    end

    describe '#recipe_link' do 
      it { should validate_presence_of(:recipe_link) }
      it { should_not allow_value(nil).for(:recipe_link) }
    end

    describe '#recipe_title' do 
      it { should validate_presence_of(:recipe_title) }
      it { should_not allow_value(nil).for(:recipe_title) }
    end

    describe '#api_key' do 
      it { should validate_presence_of(:api_key) }
      it { should_not allow_value(nil).for(:api_key) }
    end

    it 'tests a new user creation' do 
      expect(favorite).to be_a Favorite
      expect(favorite.api_key).to be_a String
    end
  end
end
