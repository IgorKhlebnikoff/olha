require 'spec_helper'

describe Sort do
  let!(:user) { FactoryGirl.create(:user_with_profile) }
  let!(:another_user) { FactoryGirl.create(:user_with_profile) }

  describe 'execute' do
    it 'returns DESC sorted array of users' do
      result = User.sort_by('created_at')
      expect(result).not_to be_empty
    end

    it 'returns ASC sorted array of users' do
      result = User.sort_by('created_at', 'ASC')
      expect(result).not_to be_empty
    end

    it 'returns DESC sorted array of users' do
      result = User.sort_by('created_at')
      expect(result).to eq([another_user, user])
    end

    it 'returns ASC sorted array of users' do
      result = User.sort_by('created_at', 'ASC')
      expect(result).to eq([user, another_user])
    end
  end
end
