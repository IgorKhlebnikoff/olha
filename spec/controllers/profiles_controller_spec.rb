require 'spec_helper'

describe ProfilesController do
  let(:user) { FactoryGirl.create(:user_with_profile) }
  let(:profile) { user.profile }

  before(:each) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(true)
  end

  context '#show' do
    before { get :show, id: profile }

    it { expect(response).to render_template('show') }
    it { expect(assigns(@profile)).to_not be_empty }
    it { expect(assigns(@code)).to_not be_empty }
    it { expect(assigns(@country)).to_not be_empty }
  end

  context '#show with nil params' do
    let(:user) { FactoryGirl.create(:user) }
    let(:profile) { user.profile }

    before { get :show, id: profile }

    it { expect(response).to redirect_to edit_profile_path(profile) }
    it { expect(assigns(@profile)).to_not be_empty }
  end

  context '#edit' do

    before { get :edit, id: profile }

    it { expect(response).to render_template('edit') }
    it { expect(assigns(@profile)).to_not be_empty }
  end

  describe '#update' do

    context 'response' do
      let(:true_attributes) { FactoryGirl.attributes_for(:profile) } 

      before { put :update, id: profile, profile: true_attributes }

      it { expect(response.status).to eq(302) }
      it { expect(assigns(@profile)).to_not be_empty }
    end

    context 'failure if set' do
      after do
        profile.reload
        response.should render_template 'edit'
      end

      it 'wrong first_name' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, first_name: nil)
      end

      it 'wrong last_name' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, last_name: nil)
      end

      it 'wrong phone_number' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, phone_number: nil)
      end

      it 'wrong gender' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, gender: nil)
      end

      it 'wrong country' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, country: nil)
      end
    end
  end
end
