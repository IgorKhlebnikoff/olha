class Bag < ActiveRecord::Base
  has_many :variants

  belongs_to :user

end
