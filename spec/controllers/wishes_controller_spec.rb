require 'spec_helper'

describe WishesController do
  let(:user) { FactoryGirl.create(:user_with_profile) }
  let(:variant) { FactoryGirl.create(:variant) }

  before(:each) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(true)
  end

  describe '#index' do
    before { get :index }

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { expect(assigns(:wishes)).to_not be_nil }
  end

  describe '#add' do
    context 'valid params' do
      context 'shoulda testing' do
        before { xhr :get, :add, wish_id: variant }

        it { should respond_with(:success) }
        it { should render_template(:add) }
        it { expect(assigns(:variant)).to_not be_nil }
        it { expect(assigns(:wish)).to_not be_nil }
        it { should set_the_flash }
      end

      context 'methods calling' do
        it 'should call push method' do
          Wish.any_instance.should_receive(:push).and_return({})
          xhr :get, :add, wish_id: variant
        end
      end
    end

    context 'invalid params' do
      context 'shoulda testing' do
        before { xhr :get, :add, wish_id: variant }

        it { should respond_with(:success) }
        it { should render_template(:add) }
        it { expect(assigns(:variant)).to_not be_nil }
        it { expect(assigns(:wish)).to_not be_nil }
        it { should set_the_flash }
      end

      context 'methods calling' do
        it 'should call push method' do
          Wish.any_instance.should_receive(:push).and_return({})
          xhr :get, :add, wish_id: variant
        end
      end
    end
  end

  describe '#remove' do
    context 'valid params' do
      context 'shoulda testing' do
        before { xhr :get, :remove, wish_id: variant }

        it { should respond_with(:success) }
        it { should render_template(:remove) }
        it { expect(assigns(:variant)).to_not be_nil }
        it { expect(assigns(:wish)).to_not be_nil }
        it { should set_the_flash }
      end

      context 'methods calling' do
        it 'should delete push method' do
          Wish.any_instance.should_receive(:delete).and_return({})
          xhr :get, :remove, wish_id: variant
        end
      end
    end

    context 'invalid params' do
      context 'shoulda testing' do
        before { xhr :get, :remove, wish_id: variant.id.to_i + 1 }

        it { should respond_with(:success) }
        it { should render_template(:remove) }
        it { expect(assigns(:variant)).to be_nil }
        it { expect(assigns(:wish)).to_not be_nil }
        it { should set_the_flash }
      end

      context 'methods calling' do
        it 'should call delete method' do
          Wish.any_instance.should_receive(:delete).and_return({})
          xhr :get, :remove, wish_id: variant
        end
      end
    end
  end
end
