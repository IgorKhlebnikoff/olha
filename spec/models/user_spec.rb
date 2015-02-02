require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:role) { FactoryGirl.create(:role) }

  it 'successfully create 1 user' do
    expect(User.all).to have(1).items
  end

  it 'delete user' do
    User.last.delete
    expect(User).to have(0).record
  end

  describe 'delegates' do
    let(:user_with_profile) { FactoryGirl.create(:user_with_profile) }
    
    it 'has method first_name' do
      expect(user_with_profile.first_name).to be_present
    end

    it 'has method last_name' do
      expect(user_with_profile.last_name).to be_present
    end

    it 'has method full_name' do
      expect(user_with_profile.full_name).to be_present
    end

    it 'has method gender' do
      expect(user_with_profile.gender).to be_present
    end

    it 'has method phone_number' do
      expect(user_with_profile.phone_number).to be_present
    end
  end

  describe 'associations' do
    it { should have_one(:profile) }
    it { should have_one(:bag) }
    it { should have_many(:orders) }
    it { should have_many(:authentications) }
    it { should have_many(:left_reviews) }
    it { should have_many(:wishes).through(:wish_lists) }
    it { should have_many(:wish_lists) }

    it { should belong_to(:role) }
  end

  describe 'validation' do
    it { should validate_uniqueness_of(:email) }
  end

  describe 'instance methods' do
    context 'is_admin?' do
      let(:admin) { FactoryGirl.create(:admin, role: role) }

      it 'returns true' do
        expect(admin.is_admin?).to be_true
      end

      it 'returns false' do
        expect(user.is_admin?).to be_false
      end
    end
  end
end
