class Order < ActiveRecord::Base
  has_many :variants

  belongs_to :user

  validates :quantity, presence: true
end
