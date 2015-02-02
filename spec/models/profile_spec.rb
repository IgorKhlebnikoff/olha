require 'rails_helper'
require 'spec_helper'

RSpec.describe Profile, :type => :model do
  let(:profile) { FactoryGirl.create(:profile) }

  context 'associations' do
    it { should belong_to :user }
  end

  context 'created profile must has require fields' do
    it 'first_name must be present' do
      expect(profile.first_name.empty?).to be false
    end

    it 'last_name must be present' do
      expect(profile.last_name.empty?).to be false
    end

    it 'phone_number must be present' do
      expect(profile.phone_number.empty?).to be false
    end

    it 'gender must be present' do
      expect(profile.gender).to eq('Male')
    end

    it 'country must be present' do
      expect(profile.country).to eq('UA')
    end
  end

  describe 'validation' do
    let(:profile) { FactoryGirl.build(:profile) }
    
    context '#with valid params' do
      it 'should be valid' do
        expect(profile).to be_valid
      end
    end

    context '#with not valid params' do
      after { expect(profile).to_not be_valid }

      it 'nil first_name should not be valid' do
        profile.first_name = nil
        expect(profile).to_not be_valid
      end

      it ':1 char first_name should not be valid' do
        profile.first_name = 'a'
      end

      it ':nil last_name should not be valid' do
        profile.last_name = nil
      end

      it ':1 char last_name should not be valid' do
        profile.last_name = 'a'
      end

      it ':nil phone_number should not be valid' do
        profile.phone_number = nil
      end

      it ':char phone_number should not be valid' do
        profile.phone_number = 'aksjaksjaksjaks'
      end

      it ':nil gender should not be valid' do
        profile.gender = nil
      end

      it ':wrong gender should not be valid' do
        profile.gender = 'child'
      end

      it ':nil country should not be valid' do
        profile.country = nil
      end
    end
  end

  context '#full_name should be "first_name last_name"' do
    it 'full_name' do
      expect(profile.full_name).to eq("#{profile.first_name} #{profile.last_name}")    
    end
  end
end

