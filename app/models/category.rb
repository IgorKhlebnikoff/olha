class Category < ActiveRecord::Base
  has_many :assortments

  attr_accessible :name

  validates :name, presence: true, uniqueness: true
end
