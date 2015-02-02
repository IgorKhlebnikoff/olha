class Order < ActiveRecord::Base
  has_many :variants

  belongs_to :user

  attr_accessible :quantity, :user_id

  validates :quantity, presence: true
end
