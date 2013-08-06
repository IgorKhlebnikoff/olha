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
    it { expect(response).to be_success }
    it { expect(response.status).to eq(200) }
    it { expect(assigns(@profile)).to_not be_empty }
    
  end

  context '#edit' do

    before { get :edit, id: profile }

    it { expect(response).to be_success }
    it { expect(response.status).to eq(200) }
    it { expect(assigns(@profile)).to_not be_empty }
    
  end

  describe '#update' do

    context 'response' do
      let(:true_attributes) { FactoryGirl.attributes_for(:profile) } 
      before { put :update, id: profile, profile: true_attributes }
      it { expect(response.status).to eq(302) }
      it { expect(assigns(@profile)).to_not be_empty }
    end

    context 'nil params' do
    
      it 'nil first_name attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, first_name: nil)
        profile.reload
        expect(profile.first_name).to eq("#{profile.first_name}")
      end

      it 'render if first_name attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, first_name: nil)
        profile.reload
        response.should render_template 'edit'
      end

      it 'nil last_name attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, last_name: nil)
        profile.reload
        expect(profile.last_name).to eq("#{profile.last_name}")
      end

      it 'render if last_name attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, last_name: nil)
        profile.reload
        response.should render_template 'edit'
      end
        
      it 'nil phone_number attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, phone_number: nil)
        profile.reload
        expect(profile.phone_number).to eq("#{profile.phone_number}")
      end

      it 'render if phone_number attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, phone_number: nil)
        profile.reload
        response.should render_template 'edit'
      end

      it 'nil gender attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, gender: nil)
        profile.reload
        expect(profile.gender).to eq("#{profile.gender}")
      end

      it 'render if gender attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, gender: nil)
        profile.reload
        response.should render_template 'edit'
      end

      it 'nil country attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, country: nil)
        profile.reload
        expect(profile.country).to eq("#{profile.country}")
      end

      it 'render if country attributes should not be update' do
        put :update, id: profile, profile: FactoryGirl.attributes_for(:profile, country: nil)
        profile.reload
        response.should render_template 'edit'
      end

    end
  end
end