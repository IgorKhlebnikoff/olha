require 'spec_helper'

describe Variant do
  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:color) }
    it { should belong_to(:size) }
    it { should belong_to(:price) }

    it { should have_many(:wanters).through(:wish_lists) }
    it { should have_many(:wish_lists) }
  end
end

