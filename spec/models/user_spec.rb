require 'spec_helper'

describe User do
  #let(:user) { FactoryGirl.create(:user) }

  it "should successfully create 3 user" do
    3.times do
      FactoryGirl.create(:user)
    end
    expect(User.all).to have(3).items
  end

  it "should delete user" do
    FactoryGirl.create(:user)
    User.last.delete
    expect(User).to have(0).record
  end

  context 'delegates' do
    let(:user_with_profile) { FactoryGirl.create(:user_with_profile) }
    
    it "should have method first_name" do
      expect(user_with_profile.first_name).to be_present
    end

    it "should have method last_name" do
      expect(user_with_profile.last_name).to be_present
    end

    it "should have method full_name" do
      expect(user_with_profile.full_name).to be_present
    end

    it "should have method gender" do
      expect(user_with_profile.gender).to be_present
    end

    it "should have method phone_number" do
      expect(user_with_profile.phone_number).to be_present
    end
  end

  context 'validation' do
    it { should validate_uniqueness_of(:email) }
  end
end
