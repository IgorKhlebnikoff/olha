require 'spec_helper'

describe Profile do

  context 'associations' do
    it { should belong_to :user }
  end

  context 'created profile must has require fields' do

    let(:profile) { FactoryGirl.create(:profile) }

    it 'first_name must be present' do
      expect(profile.first_name.empty?).to be_false
    end

    it 'last_name must be present' do
      expect(profile.last_name.empty?).to be_false
    end

    it 'phone_number must be present' do
      expect(profile.phone_number.empty?).to be_false
    end

    it 'gender must be present' do
      expect(profile.gender).to eq('Male')
    end

    it 'country must be present' do
      expect(profile.country).to eq('UA')
    end
  end

  context 'validation' do
    let(:profile) { FactoryGirl.build(:profile) }
    it 'should be valid' do
      expect(profile).to be_valid
    end

    it 'nil first_name should not be valid' do
      profile.first_name = nil
      expect(profile).to_not be_valid
    end

    it '1 char first_name should not be valid' do
      profile.first_name = 'a'
      expect(profile).to_not be_valid
    end

    it 'nil last_name should not be valid' do
      profile.last_name = nil
      expect(profile).to_not be_valid
    end

    it '1 char last_name should not be valid' do
      profile.last_name = 'a'
      expect(profile).to_not be_valid
    end

    it 'nil phone_number should not be valid' do
      profile.phone_number = nil
      expect(profile).to_not be_valid
    end

    it 'char phone_number should not be valid' do
      profile.phone_number = 'aksjaksjaksjaks'
      expect(profile).to_not be_valid
    end

    it 'nil gender should not be valid' do
      profile.gender = nil
      expect(profile).to_not be_valid
    end

    it 'wrong gender should not be valid' do
      profile.gender = 'child'
      expect(profile).to_not be_valid
    end

    it 'nil country should not be valid' do
      profile.country = nil
      expect(profile).to_not be_valid
    end
  end
end