class WishList < ActiveRecord::Base
  belongs_to :user
  belongs_to :wish, class_name: 'Variant'

  #attr_accessible :user, :wish

  validates :wish_id, uniqueness: { scope: :user_id }
end
