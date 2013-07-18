class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  attr_accessible :body, :product_id, :user_id

  validates :body, :product_id, :user_id, presence: true
end
