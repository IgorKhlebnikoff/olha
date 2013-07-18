class Assortment < ActiveRecord::Base
  has_many :products

  belongs_to :category
  
  attr_accessible :name, :category_id

  validates :name, presence: true
end
