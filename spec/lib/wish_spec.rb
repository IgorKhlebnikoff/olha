require 'spec_helper'


describe Wish do
  let!(:user) { FactoryGirl.create(:user_with_profile) }
  let!(:variant) { FactoryGirl.create(:variant) }
  let(:result) do
    {
      result: result,
      notice: notice
    }
  end

  subject { Wish.new(user) }

  describe 'instance methods' do
    describe 'push' do
      context 'valid params' do
        it 'returns true' do
          subject.push(variant)
          expect(WishList.all).to have(1).items
        end
      end

      context 'invalid params' do
        it 'returns false' do
          subject.push(variant)
          expect(subject.push(variant)[:result]).to be false
        end
      end
    end

    describe 'delete' do
      it 'delete wish from user\'s wish_list' do
        subject.push(variant)
        expect(subject.delete(variant)[:result]).to be true
      end

      it 'does not delete wish from user\'s wish_list' do
        expect(subject.delete(variant)[:result]).to be false
      end
    end
  end
end
