require 'rails_helper'
RSpec.describe RaterController, :type => :controller do
  describe "Post create" do
    let(:user) { FactoryGirl.create(:user_with_profile) }
    let(:product) { FactoryGirl.create(:product) }
    before(:each) do
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:user_signed_in?).and_return(true)
    end
    it "returns http success" do
      post :create, klass: 'product', id: product.id, dimension: "price", score: 2, format: :json
      expect(response.body).to eq 'true'
    end
  end
end