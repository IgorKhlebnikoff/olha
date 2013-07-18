class Size < ActiveRecord::Base
  has_many :variants

  attr_accessible :name

  validates :name, presence: true
end
