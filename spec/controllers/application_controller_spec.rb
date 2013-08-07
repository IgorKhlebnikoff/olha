require 'spec_helper'

describe ProfilesController do
  let(:user) { FactoryGirl.create(:user_with_profile) }
  let(:profile) { user.profile }

  before(:each) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(true)
  end

  context "description" do
    it { expect(current_user).to eq(user) }
  end
end
