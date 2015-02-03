require 'rails_helper'
require 'spec_helper'

RSpec.describe WishList, :type => :model do
  let!(:user) { FactoryGirl.create(:user_with_profile) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:wish) }
  end

  describe 'validations' do
    let!(:variant) { FactoryGirl.create(:variant) }
    subject { Wish.new(user) }

    context 'valid params' do
      it 'valid object' do
        subject.push(variant)
        expect(WishList.all).to have(1).items
      end
    end

    context 'invalid params' do
      it 'invalid object' do
        subject.push(variant)
        expect(subject.push(variant)[:result]).to be false
      end
    end
  end
end
