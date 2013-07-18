class Variant < ActiveRecord::Base
  belongs_to :product
  belongs_to :color
  belongs_to :size
  belongs_to :price
  
  attr_accessible :title, :body

  validates :in_stock, presence: true
  validates :product_id, :color_id, :size_id, :price_id, presence: true
end
