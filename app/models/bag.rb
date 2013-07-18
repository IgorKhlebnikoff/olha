class Bag < ActiveRecord::Base
  has_many :variants

  belongs_to :user

  attr_accessible :user_id
end
