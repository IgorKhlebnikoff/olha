require 'spec_helper'

describe ProfilesController do
  let(:user) { FactoryGirl.create(:user_with_profile) }
  let(:user_just_create) { FactoryGirl.create(:user) }
  let(:profile) { user.profile }
  let(:profile_just_create_user) { user_just_create.profile }

  before(:each) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(true)
  end

  context '#show' do
    before { get :show, id: profile }
    it { expect(response).to render_template('show') }
    it { expect(assigns(@profile)).to_not be_empty }
  end

  context '#show whis nil params' do
    let(:user) { FactoryGirl.create(:user) }
    let(:profile) { user.profile }
    before do
      get :show, id: profile
    end

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

    context 'nil first_name' do
      before do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, first_name: nil)
        profile.reload
      end
      it { expect(profile.first_name).to eq("#{profile.first_name}") }
      it { response.should render_template 'edit' }
    end

    context 'nil last_name' do
      before do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, last_name: nil)
        profile.reload
      end
      it { expect(profile.last_name).to eq("#{profile.last_name}") }
      it { response.should render_template 'edit' }
    end

    context 'nil phone_number' do
      before do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, phone_number: nil)
        profile.reload
      end
      it { expect(profile.phone_number).to eq("#{profile.phone_number}") }
      it { response.should render_template 'edit' }
    end

    context 'nil gender' do
      before do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, gender: nil)
        profile.reload
      end
      it { expect(profile.gender).to eq("#{profile.gender}") }
      it { response.should render_template 'edit' }
    end

    context 'nil country' do
      before do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, country: nil)
        profile.reload
      end
      it { expect(profile.country).to eq("#{profile.country}") }
      it { response.should render_template 'edit' }
    end
  end
end