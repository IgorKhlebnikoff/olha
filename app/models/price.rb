class Price < ActiveRecord::Base
  has_one :currency

  has_many :variants, dependent: :destroy

  attr_accessible :amount, :currency_id

  validates :amount, presence: true
end
