require 'rails_helper'
require 'spec_helper'

RSpec.describe Filter do
  let!(:user) { FactoryGirl.create(:user_with_profile) }
  let!(:another_user) { FactoryGirl.create(:user_with_profile) }

  describe 'execute' do
    it 'returns only user' do
      result = User.filter_by('email', user.email)
      expect(result).to eq([user])
    end

    it 'returns 2 users' do
      result = User.filter_by('email', '@')
      expect(result).to eq([user, another_user])
    end

    it 'returns empty array' do
      result = User.filter_by('email', '12')
      expect(result).to be_empty
    end
  end
end
