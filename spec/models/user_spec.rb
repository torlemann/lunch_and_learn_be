require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do 
    let(:user) { FactoryBot.create(:user)}

    describe '#email' do 
      it { should validate_presence_of(:email) }
      it { should_not allow_value(nil).for(:email) }
      it { should validate_uniqueness_of(:email) }
    end

    describe '#name' do 
      it { should validate_presence_of(:name) }
      it { should_not allow_value(nil).for(:name) }
    end

    it 'tests a new user creation' do 
      expect(user).to be_a User
      expect(user.api_key).to be_a String
    end
  end
end
