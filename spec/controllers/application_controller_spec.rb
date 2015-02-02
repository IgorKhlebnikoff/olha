require 'rails_helper'
require 'spec_helper'

RSpec.describe ProfilesController, :type => :controller do
  let(:user) { FactoryGirl.create(:user_with_profile) }
  let(:profile) { user.profile }

  before(:each) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(true)
  end
end
