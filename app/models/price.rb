class Price < ActiveRecord::Base
  belongs_to :currency

  belongs_to :variant

  attr_accessible :amount, :currency_id

  validates :amount, presence: true
end
