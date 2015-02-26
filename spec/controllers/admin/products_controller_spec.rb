require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin::ProductsController, :type => :controller do
  let(:user) { FactoryGirl.create(:user_with_profile) }
  let(:profile) { user.profile }

  before(:each) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(true)
  end

  describe 'index' do
    before do
      get :index
    end

    it { expect(response).to render_template(:index) }
    it { expect(assigns(:products)).to be }
    it { expect(response.status).to eq(200) }
  end

  describe 'index action format js' do
    before do
      xhr :get, :index
    end

    it { expect(response.content_type) == Mime::JS }
    it { expect(assigns(:products)).to be }
    it { expect(response.status).to eq(200) }
  end

  describe 'new' do
    let(:product) { FactoryGirl.create(:product) }
    before do
      xhr :get, :new
    end

    it { expect(response.content_type) == Mime::JS }
    it { expect(assigns(:product)).to be }
    it { expect(response.status).to eq(200) }
  end

  describe 'create' do
    before do
      xhr :post, :create, product: { name: 'some name', description: 'some description' }
    end

    it { expect(response.content_type) == Mime::JS }
    it { expect(assigns(:product)).to be }
    it { expect(response.status).to eq(200) }
  end

  describe 'update' do
    let!(:product) { FactoryGirl.create(:product) }
    before do
    end

    it 'sets product' do
      put :update, id: product, product: { name: 'some name', description: 'some description' }
      expect(assigns(:product)).to be
    end

    it 'sets status 302' do
      put :update, id: product, product: { name: 'some name', description: 'some description' }
      expect(response.status).to eq(302)
    end

    it 'redirect to admin_product_path' do
      put :update, id: product, product: { name: 'some name', description: 'some description' }
      expect(response).to redirect_to admin_product_path(product)
    end

    it 'render to edit' do
      put :update, id: product, product: { name: 'n', description: 'some description'  }
      expect(response).to render_template(:edit)
    end

    it 'sets status 200' do
      put :update, id: product, product: { name: 'n', description: 'some description'  }
      expect(response.status).to eq(200)
    end
  end

  describe 'destroy' do
    let(:product) { FactoryGirl.create(:product) }
    before do
      delete :destroy, id: product
    end

    it { expect(response).to redirect_to admin_products_path }
    it { expect(response.status).to eq(302) }
  end

end