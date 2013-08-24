require 'spec_helper'

describe SearchesController do
  let(:variant) { FactoryGirl.create(:variant) }

  describe '#index' do
    before(:each) do
      controller.stub(:current_user).and_return(nil)
      Search.any_instance.stub(:execute).and_return([])
    end

    before { get :index, term: 'term' }

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { expect(assigns(:results)).to_not be_nil }
  end
end
